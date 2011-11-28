FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/Planner/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/Mood.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Mood.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
