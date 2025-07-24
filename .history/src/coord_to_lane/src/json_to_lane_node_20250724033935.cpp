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
 
bool extractLatLonFromGeoJSON(std::vector<std::pair<double, double>>& coords)
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

    if (!j.contains("task_points") || !j["task_points"].is_array()) {
        ROS_ERROR("GeoJSON içinde 'task_points' bulunamadı veya geçersiz.");
        return false;
    }

    for (const auto& pt : j["task_points"]) {
        if (pt.contains("lat") && pt.contains("lon")) {
            coords.emplace_back(pt["lat"], pt["lon"]);
        }
    }

    return true;
}

int findNearestLanelet(double lat, double lon)
{
    lanelet::BasicPoint3d projected = projector.forward({lat, lon});
    lanelet::BasicPoint2d utm_point(projected.x(), projected.y());    
    auto nearest = lanelet::geometry::findNearest(lanelet_map->laneletLayer, utm_point, 1);
    return nearest.empty() ? -1 : nearest.front().second.id();
}

bool handleRequest(coord_to_lane::JsonToLane::Request& req,
                   coord_to_lane::JsonToLane::Response& res)
{
    std::vector<std::pair<double, double>> coords;
    if (!extractLatLonFromGeoJSON(coords)) {
        ROS_ERROR("GeoJSON'dan koordinatlar okunamadı.");
        return false;
    }

    for (const auto& [lat, lon] : coords) {
        int id = findNearestLanelet(lat, lon);
        res.lanelet_ids.push_back(id);
        ROS_INFO_STREAM("(" << lat << ", " << lon << ") -> lanelet ID: " << id);
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
