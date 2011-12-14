#!/usr/bin/env python
import roslib; roslib.load_manifest('FredChest')
import rospy
import pygame.display
import pygame.image
from Planner.msg import Mood
from Planner.msg import Bottle
from std_msgs.msg import String
import os


def callbackscreen(message):
	if message.data == "full":
		screenplane = pygame.display.set_mode((0,0),pygame.FULLSCREEN | pygame.DOUBLEBUF | pygame.HWSURFACE,0)
		displayPicture()
		rospy.loginfo(rospy.get_name()+" Switching to fullscreen mode")
	elif message.data == "close":
		os.system("xrandr -o right")
		screenplane = pygame.display.set_mode((0,0),0,0)
		displayPicture()
		rospy.loginfo(rospy.get_name()+" Closing fullscreen mode")

def displayPicture():
	screenplane.blit(picture, (0, 0))
	pygame.display.update()
	

def callback(message):
	global picture
	if message.bottle == 0:
		picture  = bottle_cross
		rospy.loginfo(rospy.get_name()+" Detected not bottle")
	elif message.bottle == 1:
		picture = bottle_tick
		rospy.loginfo(rospy.get_name()+" Bottle detected")
	else: 
		picture = bottle_pic
	
	#new colour calculation, with skipping gradient near zero
	if message.data > 0:
		level = int(message.data*1.55)+100
		screenplane.fill((level,level,0,0))
	elif message.data < 0:
		level = int(abs(message.data)*1.55)+100
		screenplane.fill((0,0,level,0))
	else:
		level = 0
		screenplane.fill((0,0,0,0))

	#old calculation
	#level = int(((message.data+100)%201)*1.275)
	rospy.loginfo(rospy.get_name()+" Mood input: %i, rg(not b) level: %i",message.data,level)
	#colors are set at 255,255,0 when happy (yellow), downto to 0,0,255 when sad (blue)
	#at neutral it is black
	displayPicture()

def screen():
	rospy.init_node('screen')
	rospy.Subscriber("mood", Mood, callback)
	rospy.Subscriber("screen",String, callbackscreen)
	while not rospy.is_shutdown():
		rospy.sleep(1.0)

if __name__ == '__main__':
	os.system("xrandr -o normal")
	pygame.display.init()
	screenplane = pygame.display.set_mode((0,0),pygame.FULLSCREEN ,0)
	pckpath = roslib.packages.get_pkg_dir("FredChest")
	bottle_pic = pygame.image.load(pckpath+"/bottle.png")
	bottle_pic = pygame.transform.rotate(bottle_pic, -90)
	bottle_cross = pygame.image.load(pckpath+"/bottle-cross.png")
	bottle_cross = pygame.transform.rotate(bottle_cross, -90)
	bottle_tick = pygame.image.load(pckpath+"/bottle-tick.png")
	bottle_tick = pygame.transform.rotate(bottle_tick, -90)
	picture = bottle_pic
	displayPicture()
	screen()
	
