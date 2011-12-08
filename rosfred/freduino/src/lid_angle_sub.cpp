#include "ros/ros.h"
#include "freduino/Angle.h"
#include "serial_utils.h"

static int serial_port;

/*
 * This method is a callback triggered when we receive a message.
 */
void chatterCallback(const freduino::Angle::ConstPtr& msg)
{
	ROS_INFO("I heard: [%i]", msg->angle);
	
	char data[3];
	snprintf(data, 3, "%02d", msg->angle);

	printf("%c%c\n", data[0], data[1]);

	char data2[6];
	data2[0] = 'S';
	data2[1] = 'M';
	data2[2] = data[0];
	data2[3] = data[1];
	data2[4] = '.';
	data2[5] = '\n';

	write_data(serial_port, data2, 6);
//	flush(serial_port);
}

int main(int argc, char **argv)
{
	// Initialise ROS
	ros::init(argc, argv, "test_lid_angle_sub");
	
	// Open and Configure the Serial Port to the Arduino
	// F is the identity of the freduino arduino
	serial_port = open_port('F');

	// Create the ROS node and start the event loop.
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("lid_angle", 10, chatterCallback);
	ros::spin();

	return 0;
}


