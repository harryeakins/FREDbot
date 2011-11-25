FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/speech_synth/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/emote_text.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_emote_text.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
