
(cl:in-package :asdf)

(defsystem "Planner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Mood" :depends-on ("_package_Mood"))
    (:file "_package_Mood" :depends-on ("_package"))
    (:file "Bottle" :depends-on ("_package_Bottle"))
    (:file "_package_Bottle" :depends-on ("_package"))
  ))