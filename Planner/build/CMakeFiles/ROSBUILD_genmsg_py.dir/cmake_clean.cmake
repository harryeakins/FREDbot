FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/Planner/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/Planner/msg/__init__.py"
  "../src/Planner/msg/_Mood.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
