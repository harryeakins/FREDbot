#include "ros/ros.h"
#include "espk.h" //espk based voice synth
//#include "emote_text.h" //custom message type
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"

int mood =  0;

//The speech synthersiser!
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s] with emotion [%i]", msg->data.c_str(), mood);
  espk((float)mood/20, msg->data.c_str());	
}

//mood topic
void moodCallback(const std_msgs::Int32::ConstPtr& msg)
{
  mood = msg->data;	
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "speech_synth");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
  ros::Subscriber sub1 = n.subscribe("mood", 1000, moodCallback);
  ros::spin();
  return 0;
}

