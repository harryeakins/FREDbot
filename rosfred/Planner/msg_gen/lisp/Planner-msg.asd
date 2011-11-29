
(cl:in-package :asdf)

(defsystem "Planner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Mood" :depends-on ("_package_Mood"))
    (:file "_package_Mood" :depends-on ("_package"))
  ))