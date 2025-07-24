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
  :slots (_lanelet_ids ))

(defmethod coord_to_lane::JsonToLaneResponse
  (:init
   (&key
    ((:lanelet_ids __lanelet_ids) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _lanelet_ids __lanelet_ids)
   self)
  (:lanelet_ids
   (&optional __lanelet_ids)
   (if __lanelet_ids (setq _lanelet_ids __lanelet_ids)) _lanelet_ids)
  (:serialization-length
   ()
   (+
    ;; int32[] _lanelet_ids
    (* 4    (length _lanelet_ids)) 4
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
   ;;
   self)
  )

(defclass coord_to_lane::JsonToLane
  :super ros::object
  :slots ())

(setf (get coord_to_lane::JsonToLane :md5sum-) "6536ea10ea6cb2d403a81b2dcef96384")
(setf (get coord_to_lane::JsonToLane :datatype-) "coord_to_lane/JsonToLane")
(setf (get coord_to_lane::JsonToLane :request) coord_to_lane::JsonToLaneRequest)
(setf (get coord_to_lane::JsonToLane :response) coord_to_lane::JsonToLaneResponse)

(defmethod coord_to_lane::JsonToLaneRequest
  (:response () (instance coord_to_lane::JsonToLaneResponse :init)))

(setf (get coord_to_lane::JsonToLaneRequest :md5sum-) "6536ea10ea6cb2d403a81b2dcef96384")
(setf (get coord_to_lane::JsonToLaneRequest :datatype-) "coord_to_lane/JsonToLaneRequest")
(setf (get coord_to_lane::JsonToLaneRequest :definition-)
      "---
int32[] lanelet_ids

")

(setf (get coord_to_lane::JsonToLaneResponse :md5sum-) "6536ea10ea6cb2d403a81b2dcef96384")
(setf (get coord_to_lane::JsonToLaneResponse :datatype-) "coord_to_lane/JsonToLaneResponse")
(setf (get coord_to_lane::JsonToLaneResponse :definition-)
      "---
int32[] lanelet_ids

")



(provide :coord_to_lane/JsonToLane "6536ea10ea6cb2d403a81b2dcef96384")


