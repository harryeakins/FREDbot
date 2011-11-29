#include "ros/ros.h"
#include "freduino/Angle.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "lid_angle_pub");
	ros::NodeHandle n;
	ros::Publisher chatter_pub = n.advertise<freduino::Angle>("lid_angle", 10);
	ros::Rate loop_rate(10);

	int count = 0;

	while (ros::ok())
	{
		freduino::Angle msg;
		msg.angle = count;
		ROS_INFO("%i", msg.angle);

		chatter_pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
		++count;
	}

	return 0;
}

