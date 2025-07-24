```
cd ~/coord_to_lane_ws
source devel/setup.bash
roslaunch coord_to_lane planner.launch
```
-------------------------------------
```
source ~/coord_to_lane_ws/devel/setup.bash
rosservice list | grep geojson  # Servisin adı gözükmeli
rosservice type /geojson_lane_service_node/geojson_to_lanelets  # Tip: coord_to_lane/JsonToLane
```
### Servisi çağır:
```
rosservice call /geojson_lane_service_node/geojson_to_lanelets "{}"
```
--------------------------------------
