; Auto-generated. Do not edit!


(cl:in-package Planner-msg)


;//! \htmlinclude Mood.msg.html

(cl:defclass <Mood> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass Mood (<Mood>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mood>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mood)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name Planner-msg:<Mood> is deprecated: use Planner-msg:Mood instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Mood>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader Planner-msg:data-val is deprecated.  Use Planner-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mood>) ostream)
  "Serializes a message object of type '<Mood>"
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mood>) istream)
  "Deserializes a message object of type '<Mood>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mood>)))
  "Returns string type for a message object of type '<Mood>"
  "Planner/Mood")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mood)))
  "Returns string type for a message object of type 'Mood"
  "Planner/Mood")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mood>)))
  "Returns md5sum for a message object of type '<Mood>"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mood)))
  "Returns md5sum for a message object of type 'Mood"
  "da5909fbe378aeaf85e547e830cc1bb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mood>)))
  "Returns full string definition for message of type '<Mood>"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mood)))
  "Returns full string definition for message of type 'Mood"
  (cl:format cl:nil "int32 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mood>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mood>))
  "Converts a ROS message object to a list"
  (cl:list 'Mood
    (cl:cons ':data (data msg))
))
