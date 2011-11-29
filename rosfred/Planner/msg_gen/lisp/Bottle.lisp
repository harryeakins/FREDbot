; Auto-generated. Do not edit!


(cl:in-package Planner-msg)


;//! \htmlinclude Bottle.msg.html

(cl:defclass <Bottle> (roslisp-msg-protocol:ros-message)
  ((obj_detected
    :reader obj_detected
    :initarg :obj_detected
    :type cl:integer
    :initform 0)
   (choking
    :reader choking
    :initarg :choking
    :type cl:integer
    :initform 0))
)

(cl:defclass Bottle (<Bottle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Bottle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Bottle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Planner-msg:<Bottle> is deprecated: use Planner-msg:Bottle instead.")))

(cl:ensure-generic-function 'obj_detected-val :lambda-list '(m))
(cl:defmethod obj_detected-val ((m <Bottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Planner-msg:obj_detected-val is deprecated.  Use Planner-msg:obj_detected instead.")
  (obj_detected m))

(cl:ensure-generic-function 'choking-val :lambda-list '(m))
(cl:defmethod choking-val ((m <Bottle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Planner-msg:choking-val is deprecated.  Use Planner-msg:choking instead.")
  (choking m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Bottle>) ostream)
  "Serializes a message object of type '<Bottle>"
  (cl:let* ((signed (cl:slot-value msg 'obj_detected)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'choking)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Bottle>) istream)
  "Deserializes a message object of type '<Bottle>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obj_detected) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'choking) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Bottle>)))
  "Returns string type for a message object of type '<Bottle>"
  "Planner/Bottle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Bottle)))
  "Returns string type for a message object of type 'Bottle"
  "Planner/Bottle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Bottle>)))
  "Returns md5sum for a message object of type '<Bottle>"
  "367d0d65df23e79004c0a4faa4f6193f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Bottle)))
  "Returns md5sum for a message object of type 'Bottle"
  "367d0d65df23e79004c0a4faa4f6193f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Bottle>)))
  "Returns full string definition for message of type '<Bottle>"
  (cl:format cl:nil "int32 obj_detected~%int32 choking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Bottle)))
  "Returns full string definition for message of type 'Bottle"
  (cl:format cl:nil "int32 obj_detected~%int32 choking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Bottle>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Bottle>))
  "Converts a ROS message object to a list"
  (cl:list 'Bottle
    (cl:cons ':obj_detected (obj_detected msg))
    (cl:cons ':choking (choking msg))
))
