#include "ros/ros.h"
#include "freduino/Angle.h"

void chatterCallback(const freduino::Angle::ConstPtr& msg)
{
	ROS_INFO("I heard: [%i]", msg->angle);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "test_lid_angle_sub");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("lid_angle", 10, chatterCallback);
	ros::spin();
	return 0;
}


