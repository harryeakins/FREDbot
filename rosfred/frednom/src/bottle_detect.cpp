#include "ros/ros.h"
#include <Planner/Bottle.h>
#include "serial_utils.h"

static int serial_port;

int main(int argc, char **argv)
{
	// Initialise ROS
	ros::init(argc, argv, "bottle_detect_pub");
	
	// Open and Configure the Serial Port to the Arduino
	// F is the identity of the freduino arduino
	serial_port = open_port('B');

	// Create the ROS node and start the event loop.
	ros::NodeHandle n;
	ros::Publisher pub = n.advertise<Planner::Bottle>("bottle", 10);

	ros::Rate loop_rate(10);
	while(ros::ok()) {
		char response[100];
		Planner::Bottle msg;

		//Bottle Detection
		if(read_data(serial_port, response, 100) >0)
		{
			msg.choking = 0;
			switch (response[0]) {
				case 'B':
				msg.obj_detected = 1;
				pub.publish(msg);
				break;

				case 'N':
				msg.obj_detected = 0;
				pub.publish(msg);
				break;

				case 'C':
				msg.obj_detected = 2;
				msg.choking = 1;
				pub.publish(msg);
				break;

			}
			
			
		}
//---------------------------------------------------------------------------------------

		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;
}


