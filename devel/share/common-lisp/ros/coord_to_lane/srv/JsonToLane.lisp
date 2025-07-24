; Auto-generated. Do not edit!


(cl:in-package coord_to_lane-srv)


;//! \htmlinclude JsonToLane-request.msg.html

(cl:defclass <JsonToLane-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass JsonToLane-request (<JsonToLane-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JsonToLane-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JsonToLane-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name coord_to_lane-srv:<JsonToLane-request> is deprecated: use coord_to_lane-srv:JsonToLane-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JsonToLane-request>) ostream)
  "Serializes a message object of type '<JsonToLane-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JsonToLane-request>) istream)
  "Deserializes a message object of type '<JsonToLane-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JsonToLane-request>)))
  "Returns string type for a service object of type '<JsonToLane-request>"
  "coord_to_lane/JsonToLaneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JsonToLane-request)))
  "Returns string type for a service object of type 'JsonToLane-request"
  "coord_to_lane/JsonToLaneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JsonToLane-request>)))
  "Returns md5sum for a message object of type '<JsonToLane-request>"
  "6536ea10ea6cb2d403a81b2dcef96384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JsonToLane-request)))
  "Returns md5sum for a message object of type 'JsonToLane-request"
  "6536ea10ea6cb2d403a81b2dcef96384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JsonToLane-request>)))
  "Returns full string definition for message of type '<JsonToLane-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JsonToLane-request)))
  "Returns full string definition for message of type 'JsonToLane-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JsonToLane-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JsonToLane-request>))
  "Converts a ROS message object to a list"
  (cl:list 'JsonToLane-request
))
;//! \htmlinclude JsonToLane-response.msg.html

(cl:defclass <JsonToLane-response> (roslisp-msg-protocol:ros-message)
  ((lanelet_ids
    :reader lanelet_ids
    :initarg :lanelet_ids
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass JsonToLane-response (<JsonToLane-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JsonToLane-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JsonToLane-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name coord_to_lane-srv:<JsonToLane-response> is deprecated: use coord_to_lane-srv:JsonToLane-response instead.")))

(cl:ensure-generic-function 'lanelet_ids-val :lambda-list '(m))
(cl:defmethod lanelet_ids-val ((m <JsonToLane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader coord_to_lane-srv:lanelet_ids-val is deprecated.  Use coord_to_lane-srv:lanelet_ids instead.")
  (lanelet_ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JsonToLane-response>) ostream)
  "Serializes a message object of type '<JsonToLane-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lanelet_ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'lanelet_ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JsonToLane-response>) istream)
  "Deserializes a message object of type '<JsonToLane-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lanelet_ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lanelet_ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JsonToLane-response>)))
  "Returns string type for a service object of type '<JsonToLane-response>"
  "coord_to_lane/JsonToLaneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JsonToLane-response)))
  "Returns string type for a service object of type 'JsonToLane-response"
  "coord_to_lane/JsonToLaneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JsonToLane-response>)))
  "Returns md5sum for a message object of type '<JsonToLane-response>"
  "6536ea10ea6cb2d403a81b2dcef96384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JsonToLane-response)))
  "Returns md5sum for a message object of type 'JsonToLane-response"
  "6536ea10ea6cb2d403a81b2dcef96384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JsonToLane-response>)))
  "Returns full string definition for message of type '<JsonToLane-response>"
  (cl:format cl:nil "int32[] lanelet_ids~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JsonToLane-response)))
  "Returns full string definition for message of type 'JsonToLane-response"
  (cl:format cl:nil "int32[] lanelet_ids~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JsonToLane-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lanelet_ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JsonToLane-response>))
  "Converts a ROS message object to a list"
  (cl:list 'JsonToLane-response
    (cl:cons ':lanelet_ids (lanelet_ids msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'JsonToLane)))
  'JsonToLane-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'JsonToLane)))
  'JsonToLane-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JsonToLane)))
  "Returns string type for a service object of type '<JsonToLane>"
  "coord_to_lane/JsonToLane")