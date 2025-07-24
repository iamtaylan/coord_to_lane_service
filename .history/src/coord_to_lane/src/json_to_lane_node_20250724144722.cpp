#include <ros/ros.h>
#include <lanelet2_core/LaneletMap.h>
#include <lanelet2_io/Io.h>
#include <lanelet2_projection/UTM.h>
#include <lanelet2_core/primitives/Lanelet.h>
#include <lanelet2_core/geometry/Point.h>
#include <nlohmann/json.hpp>
#include <fstream>
#include <vector>

#include "coord_to_lane/JsonToLane.h"

using json = nlohmann::json;
lanelet::LaneletMapPtr lanelet_map;
lanelet::projection::UtmProjector projector(lanelet::Origin({40.9896, 29.1234}));
std::string geojson_path;
 
struct PoseInfo {
    double lat;
    double lon;
    double heading;
};

bool extractLatLonFromGeoJSON(std::vector<PoseInfo>& coords)
{
    std::ifstream file(geojson_path);
    if (!file.is_open()) {
        ROS_ERROR("GeoJSON dosyası açılamadı: %s", geojson_path.c_str());
        return false;
    }

    json j;
    try {
        file >> j;
    } catch (const std::exception& e) {
        ROS_ERROR("JSON parse hatası: %s", e.what());
        return false;
    }

    if (!j.contains("features") || !j["features"].is_array()) {
        ROS_ERROR("GeoJSON içinde 'features' bulunamadı veya geçersiz.");
        return false;
    }

    for (const auto& feature : j["features"]) {
        if (!feature.contains("geometry") || !feature.contains("properties"))
            continue;

        const auto& geom = feature["geometry"];
        const auto& prop = feature["properties"];

        if (geom["type"] != "Point" || !geom["coordinates"].is_array())
            continue;

        double lon = geom["coordinates"][0];
        double lat = geom["coordinates"][1];
        double heading = prop.value("heading", 0.0); // heading varsa al

        coords.push_back({lat, lon, heading});
    }

    return true;
}


int findNearestLaneletWithHeading(double lat, double lon, double heading_deg)
{
    lanelet::BasicPoint3d projected = projector.forward({lat, lon});
    lanelet::BasicPoint2d utm_point(projected.x(), projected.y());

    auto nearest = lanelet::geometry::findNearest(lanelet_map->laneletLayer, utm_point, 10);

    for (const auto& pair : nearest) {
        const lanelet::Lanelet& lane = pair.second;

        // Şerit yönünü hesapla (ilk iki nokta arası vektör)
        auto centerline = lane.centerline();
        if (centerline.size() < 2)
            continue;

        const auto& p0 = centerline[0];
        const auto& p1 = centerline[1];

        double dx = p1.x() - p0.x();
        double dy = p1.y() - p0.y();
        double lane_heading_rad = std::atan2(dy, dx);
        double lane_heading_deg = lane_heading_rad * 180.0 / M_PI;

        // Farkı hesapla (mutlak fark, 180 dereceyi aşarsa düzelt)
        double diff = std::fabs(lane_heading_deg - heading_deg);
        diff = std::fmod(diff + 360.0, 360.0);
        if (diff > 180.0)
            diff = 360.0 - diff;

        if (diff < 30.0) {
            return lane.id();  // uygun yön bulundu
        }
    }

    return -1; // uygun yönlü lanelet yoksa
}


bool handleRequest(coord_to_lane::JsonToLane::Request& req,
                   coord_to_lane::JsonToLane::Response& res)
{
    std::vector<PoseInfo> coords;
    if (!extractLatLonFromGeoJSON(coords)) {
        ROS_ERROR("GeoJSON'dan koordinatlar okunamadı.");
        return false;
    }

    for (const auto& pose : coords) {
        int id = findNearestLaneletWithHeading(pose.lat, pose.lon, pose.heading);
        res.lanelet_ids.push_back(id);
        ROS_INFO_STREAM("(" << pose.lat << ", " << pose.lon << ", heading: " << pose.heading << ") -> lanelet ID: " << id);
    }

    return true;
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "geojson_lane_service_node");
    ros::NodeHandle nh("~");

    if (!nh.getParam("geojson_file", geojson_path)) {
        ROS_ERROR("'geojson_file' parametresi eksik!");
        return 1;
    }

    std::string map_path;
    if (!nh.getParam("lanelet_map", map_path)) {
        ROS_ERROR("'lanelet_map' parametresi eksik!");
        return 1;
    }

    lanelet::ErrorMessages errors;
    auto map = lanelet::load(map_path, projector, &errors);
    lanelet_map = std::move(map);

    ros::ServiceServer service = nh.advertiseService("geojson_to_lanelets", handleRequest);
    ROS_INFO("geojson_to_lanelets servisi hazir.");
    ros::spin();
    return 0;
}
