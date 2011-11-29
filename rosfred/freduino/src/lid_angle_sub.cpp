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

	unsigned char data2[5];
	data2[0] = 'S';
	data2[1] = 'M';
	data2[2] = static_cast<unsigned char>(data[0]);
	data2[3] = static_cast<unsigned char>(data[1]);
	data2[4] = '.';

	write_data(serial_port, data2, 5);
}

int main(int argc, char **argv)
{
	// Initialise ROS
	ros::init(argc, argv, "test_lid_angle_sub");
	
	// Open and Configure the Serial Port to the Arduino
	serial_port = open_port();
	serial_port = configure_port(serial_port);

	// Create the ROS node and start the event loop.
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("lid_angle", 10, chatterCallback);
	ros::spin();

	return 0;
}


