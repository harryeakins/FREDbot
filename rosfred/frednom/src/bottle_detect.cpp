#include "ros/ros.h"
#include <std_msgs/Bool.h>
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
	ros::Publisher isObjectBottle = n.advertise<std_msgs::Bool>("isBottle", 10);
	ros::Publisher isFREDChoking = n.advertise<std_msgs::Bool>("isChoking", 10);

	ros::Rate loop_rate(10);
	while(ros::ok()) {
		char response[100];
		std_msgs::Bool isBottle;
		std_msgs::Bool isChoking;

		//Bottle Detection
		if(read_data(serial_port, response, 100) >0)
		{

			switch (response[0]) {
				case 'B':
				isBottle.data = true;
				isObjectBottle.publish(isBottle);
				break;

				case 'N':
				isBottle.data = false;
				isObjectBottle.publish(isBottle);
				break;

				case 'C':
				isChoking.data = true;
				isFREDChoking.publish(isChoking);
				break;

			}
			
			
		}
//---------------------------------------------------------------------------------------

		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;
}


