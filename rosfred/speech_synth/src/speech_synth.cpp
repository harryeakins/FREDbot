#include "ros/ros.h"
#include "espk.h" //espk based voice synth
#include "emote_text.h" //custom message type

//The speech synthersiser!
void chatterCallback(const speech_synth::emote_text::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s] with emotion [%f]", msg->text.c_str(), msg->emotion);
  espk(msg->emotion, msg->text.c_str());	
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "speech_synth");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
  ros::spin();
  return 0;
}

