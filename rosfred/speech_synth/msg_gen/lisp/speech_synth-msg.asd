
(cl:in-package :asdf)

(defsystem "speech_synth-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "emote_text" :depends-on ("_package_emote_text"))
    (:file "_package_emote_text" :depends-on ("_package"))
  ))