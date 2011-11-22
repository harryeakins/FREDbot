#include "ros/ros.h"
#include "std_msgs/String.h"
#include "espk.h" //espk based voice synth

//The speech synthersiser!
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
  espk(0,msg->data.c_str());	
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "speech_synth");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
  ros::spin();
  return 0;
}
