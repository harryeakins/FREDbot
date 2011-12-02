#include "ros/ros.h"
#include "freduino/Angle.h"
#include "serial_utils.h"

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/time.h>


int main(int argc, char **argv)
{
	ros::init(argc, argv, "lid_angle_pub");
	ros::NodeHandle n;
	ros::Publisher chatter_pub = n.advertise<freduino::Angle>("lid_angle", 10);
	ros::Rate loop_rate(10);

	int count = 0;
/*
    int fd = open_port();
    configure_port(fd);

	fd_set set;
	struct timeval timeout;

	FD_ZERO(&set);
	FD_SET(fd, &set);

	// Initialize the timeout data structure.
  	timeout.tv_sec = seconds;
  	timeout.tv_usec = 1;
*/
	while (ros::ok())
	{
/**
		// See if there is anything to read from the serial port.
		if(select(FD_SETSIZE, &set, NULL, NULL, &timeout) == 1) {

			// Do a read of 4 bytes.

				// If less than 4 bytes, read however many more bytes that are needed.
*/
				// Else, emit message and reset state ready for a new one.
				freduino::Angle msg;
				msg.angle = count % 100;
				ROS_INFO("%i", msg.angle);

				chatter_pub.publish(msg);
				ros::spinOnce();
				loop_rate.sleep();
				++count;
//		}
	}

//    close(fd);

	return 0;
}


