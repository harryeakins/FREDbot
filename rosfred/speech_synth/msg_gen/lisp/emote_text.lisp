; Auto-generated. Do not edit!


(cl:in-package speech_synth-msg)


;//! \htmlinclude emote_text.msg.html

(cl:defclass <emote_text> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (emotion
    :reader emotion
    :initarg :emotion
    :type cl:float
    :initform 0.0))
)

(cl:defclass emote_text (<emote_text>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <emote_text>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'emote_text)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name speech_synth-msg:<emote_text> is deprecated: use speech_synth-msg:emote_text instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <emote_text>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_synth-msg:text-val is deprecated.  Use speech_synth-msg:text instead.")
  (text m))

(cl:ensure-generic-function 'emotion-val :lambda-list '(m))
(cl:defmethod emotion-val ((m <emote_text>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader speech_synth-msg:emotion-val is deprecated.  Use speech_synth-msg:emotion instead.")
  (emotion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <emote_text>) ostream)
  "Serializes a message object of type '<emote_text>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'emotion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <emote_text>) istream)
  "Deserializes a message object of type '<emote_text>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<emote_text>)))
  "Returns string type for a message object of type '<emote_text>"
  "speech_synth/emote_text")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'emote_text)))
  "Returns string type for a message object of type 'emote_text"
  "speech_synth/emote_text")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<emote_text>)))
  "Returns md5sum for a message object of type '<emote_text>"
  "36229d26b0de5f36951d9fe138c81784")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'emote_text)))
  "Returns md5sum for a message object of type 'emote_text"
  "36229d26b0de5f36951d9fe138c81784")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<emote_text>)))
  "Returns full string definition for message of type '<emote_text>"
  (cl:format cl:nil "string text~%float32 emotion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'emote_text)))
  "Returns full string definition for message of type 'emote_text"
  (cl:format cl:nil "string text~%float32 emotion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <emote_text>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'text))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <emote_text>))
  "Converts a ROS message object to a list"
  (cl:list 'emote_text
    (cl:cons ':text (text msg))
    (cl:cons ':emotion (emotion msg))
))
