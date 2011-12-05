   _____  __                          README for SPEECH SYNTH ROS MODULE
  _______  | \                        /                      
_________  |  \____________-====- --..._                     
           '-----------------.._____...-'  

What does it do?
composed of two parts:
1. speech_synth
subscribes to the to ROS topic chatter and speaks anything on it
2. talker
every 50s sends emote text to the chatter topic from the phrases.txt file with
random emotion value.  This file location is variable depending on the ros install
but can be the root speech_synth folder or the rosfred folder.  This is intended more
 of an example program as the planner is meant to do this job.  It displays the loaded 
phrases on startup.

What is this emote text?
string text
float32 emotion

-5</emotion</+5 with +5 = full happy, -5 = fully sad

How do I use this?
compile in the he usual ROS wiki way then
rosrun speech_synth speech_synth
rosrun speech_synth talker
     

Any weid dependancies?
espeak is needed but is in defualt ubuntu install


James Lawson 2011