;; Auto-generated. Do not edit!


(when (boundp 'coord_to_lane::JsonToLane)
  (if (not (find-package "COORD_TO_LANE"))
    (make-package "COORD_TO_LANE"))
  (shadow 'JsonToLane (find-package "COORD_TO_LANE")))
(unless (find-package "COORD_TO_LANE::JSONTOLANE")
  (make-package "COORD_TO_LANE::JSONTOLANE"))
(unless (find-package "COORD_TO_LANE::JSONTOLANEREQUEST")
  (make-package "COORD_TO_LANE::JSONTOLANEREQUEST"))
(unless (find-package "COORD_TO_LANE::JSONTOLANERESPONSE")
  (make-package "COORD_TO_LANE::JSONTOLANERESPONSE"))

(in-package "ROS")





(defclass coord_to_lane::JsonToLaneRequest
  :super ros::object
  :slots ())

(defmethod coord_to_lane::JsonToLaneRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass coord_to_lane::JsonToLaneResponse
  :super ros::object
  :slots (_lanelet_ids _latitudes _longitudes _local_xs _local_ys _headings ))

(defmethod coord_to_lane::JsonToLaneResponse
  (:init
   (&key
    ((:lanelet_ids __lanelet_ids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:latitudes __latitudes) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:longitudes __longitudes) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:local_xs __local_xs) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:local_ys __local_ys) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:headings __headings) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _lanelet_ids __lanelet_ids)
   (setq _latitudes __latitudes)
   (setq _longitudes __longitudes)
   (setq _local_xs __local_xs)
   (setq _local_ys __local_ys)
   (setq _headings __headings)
   self)
  (:lanelet_ids
   (&optional __lanelet_ids)
   (if __lanelet_ids (setq _lanelet_ids __lanelet_ids)) _lanelet_ids)
  (:latitudes
   (&optional __latitudes)
   (if __latitudes (setq _latitudes __latitudes)) _latitudes)
  (:longitudes
   (&optional __longitudes)
   (if __longitudes (setq _longitudes __longitudes)) _longitudes)
  (:local_xs
   (&optional __local_xs)
   (if __local_xs (setq _local_xs __local_xs)) _local_xs)
  (:local_ys
   (&optional __local_ys)
   (if __local_ys (setq _local_ys __local_ys)) _local_ys)
  (:headings
   (&optional __headings)
   (if __headings (setq _headings __headings)) _headings)
  (:serialization-length
   ()
   (+
    ;; int32[] _lanelet_ids
    (* 4    (length _lanelet_ids)) 4
    ;; float64[] _latitudes
    (* 8    (length _latitudes)) 4
    ;; float64[] _longitudes
    (* 8    (length _longitudes)) 4
    ;; float64[] _local_xs
    (* 8    (length _local_xs)) 4
    ;; float64[] _local_ys
    (* 8    (length _local_ys)) 4
    ;; float64[] _headings
    (* 8    (length _headings)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _lanelet_ids
     (write-long (length _lanelet_ids) s)
     (dotimes (i (length _lanelet_ids))
       (write-long (elt _lanelet_ids i) s)
       )
     ;; float64[] _latitudes
     (write-long (length _latitudes) s)
     (dotimes (i (length _latitudes))
       (sys::poke (elt _latitudes i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _longitudes
     (write-long (length _longitudes) s)
     (dotimes (i (length _longitudes))
       (sys::poke (elt _longitudes i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _local_xs
     (write-long (length _local_xs) s)
     (dotimes (i (length _local_xs))
       (sys::poke (elt _local_xs i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _local_ys
     (write-long (length _local_ys) s)
     (dotimes (i (length _local_ys))
       (sys::poke (elt _local_ys i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _headings
     (write-long (length _headings) s)
     (dotimes (i (length _headings))
       (sys::poke (elt _headings i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _lanelet_ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lanelet_ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _lanelet_ids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64[] _latitudes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _latitudes (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _latitudes i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _longitudes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _longitudes (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _longitudes i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _local_xs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _local_xs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _local_xs i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _local_ys
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _local_ys (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _local_ys i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _headings
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _headings (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _headings i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass coord_to_lane::JsonToLane
  :super ros::object
  :slots ())

(setf (get coord_to_lane::JsonToLane :md5sum-) "b737285eed744467ad49ee7f51ca3326")
(setf (get coord_to_lane::JsonToLane :datatype-) "coord_to_lane/JsonToLane")
(setf (get coord_to_lane::JsonToLane :request) coord_to_lane::JsonToLaneRequest)
(setf (get coord_to_lane::JsonToLane :response) coord_to_lane::JsonToLaneResponse)

(defmethod coord_to_lane::JsonToLaneRequest
  (:response () (instance coord_to_lane::JsonToLaneResponse :init)))

(setf (get coord_to_lane::JsonToLaneRequest :md5sum-) "b737285eed744467ad49ee7f51ca3326")
(setf (get coord_to_lane::JsonToLaneRequest :datatype-) "coord_to_lane/JsonToLaneRequest")
(setf (get coord_to_lane::JsonToLaneRequest :definition-)
      "---
int32[] lanelet_ids
float64[] latitudes
float64[] longitudes
float64[] local_xs
float64[] local_ys
float64[] headings

")

(setf (get coord_to_lane::JsonToLaneResponse :md5sum-) "b737285eed744467ad49ee7f51ca3326")
(setf (get coord_to_lane::JsonToLaneResponse :datatype-) "coord_to_lane/JsonToLaneResponse")
(setf (get coord_to_lane::JsonToLaneResponse :definition-)
      "---
int32[] lanelet_ids
float64[] latitudes
float64[] longitudes
float64[] local_xs
float64[] local_ys
float64[] headings

")



(provide :coord_to_lane/JsonToLane "b737285eed744467ad49ee7f51ca3326")


