// This code is a modification of the pi_tracker package
//


#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <geometry_msgs/Vector3.h>

#include <std_msgs/Header.h>
#include "Person.h"
#include <string>
#include "KinectController.h"

#include <ros/console.h>

using std::string;

namespace people_tracker
{
	class PeopleTracker
  {
    public:
      PeopleTracker()
      {    
      }
      
      void init()
      {
		ros::NodeHandle n;
		int rate;
		n.param("tracking_rate", rate, 1);
		closest_person_pub = n.advertise<geometry_msgs::Vector3>("/closestPerson", 1000);
		people_count_pub = n.advertise<std_msgs::Int32>("/numPeople", 1000);
      }
      

//Contains loop for tracking people
    void processKinect(KinectController &kinect_controller)
      {
        XnUserID users[15];
        XnUInt16 users_count = 15;

        xn::UserGenerator& UserGenerator = kinect_controller.getUserGenerator();
	XnPoint3D com;
	float minZ;
	int userCount;
	XnUserID closestUser;
	userCount = 0;
	minZ = 200000;
        UserGenerator.GetUsers(users, users_count);
	    people_tracker::Person g_skel;

	//People Topic Variables
	geometry_msgs::Vector3 closestMsg;
	std_msgs::Int32 countMsg;
	
	
	//ROS_INFO("%s", msg.data.c_str());
	

        for (int i = 0; i < users_count; ++i)
        {
			
			XnUserID user = users[i];
				  
			UserGenerator.GetCoM(user, com);
			  
			if (!(com.X == 0 && com.Z == 0)){
				if (com.Z < minZ){
					closestUser = user;
					minZ = com.Z;
				}
				userCount++;
			}
			  //X from -600 to 600

			  
        }
	if (userCount>0){
		
		UserGenerator.GetCoM(closestUser, com);
		closestMsg.x = com.X;
		closestMsg.y = com.Y;
		closestMsg.z = com.Z;
		
		closest_person_pub.publish(closestMsg);
		
		
	}
	countMsg.data = userCount;
	people_count_pub.publish(countMsg);
      }
         
  private:
    ros::Publisher  closest_person_pub, people_count_pub ;
    
    
  };

}

KinectController g_kinect_controller;
people_tracker::PeopleTracker g_people_tracker;


int main(int argc, char** argv)
{
  ros::init(argc, argv, "people_tracker");
  ros::NodeHandle np("~");

  string filepath;
  np.getParam("load_filepath", filepath); 
  ROS_WARN_STREAM("Filepath: " << filepath);
     

  g_people_tracker.init();
  g_kinect_controller.init(filepath.c_str(), false);
  
	while(true){
		xn::SceneMetaData sceneMD;
  		g_kinect_controller.getContext().WaitAndUpdateAll();
  		g_people_tracker.processKinect(g_kinect_controller);
  		g_kinect_controller.getUserGenerator().GetUserPixels(0, sceneMD);  
	
	}
  g_kinect_controller.shutdown();
  
  return 0;
}


