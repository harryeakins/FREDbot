//This is a test program showing how to interface with the 
//emotive speech synthersiser 

#include "ros/ros.h"
#include "emote_text.h" //custom message type
#include <sstream>


int main(int argc, char **argv)
{
  ros::init(argc, argv, "talker");
  ros::NodeHandle n;
  ros::Publisher chatter_pub = n.advertise<speech_synth::emote_text>("chatter", 1000);

  ros::Rate loop_rate(0.2);

  int count = 0;
  while (ros::ok())
  {

   speech_synth::emote_text msg; //create a new message object

    std::stringstream ss;
    ss << "hello world " << count;
    msg.text = ss.str();
    msg.emotion = (rand()%11)-5; //-5 to 5

    ROS_INFO("%s | I feel: %f", msg.text.c_str(), msg.emotion);

    chatter_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}
