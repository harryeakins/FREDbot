//Lets attempt to get espeak to synthersise with emotion!
//espeak "I am happy robot" -s 30 -p 70 -a 100
//espeak "I am a sad robot" -s 10 -p 100 -a 50
//takes in a command line mood value and generates apropriate
//tone of voice.

//input emotion is -5 (sad) to 5 (happy)

//function is passed an emotion value and a c++ string

#include <iostream>
#include <cstring>
#include <string>

using namespace std;

int espk(float emotion, string text)
{
	float a, s, p; 
	char output[1024];
	char *input;	

	//Convert c++ string to c string	
	input = new char [text.size()+1];
  	strcpy (input, text.c_str());

        //emotion mapping equations
	if (emotion > 5) {emotion = 5;} //bounding
	if (emotion <-5) {emotion = -5;} //bounding
	a = (emotion*5)+75; //amplitude mapping
	p = (emotion*-3)+85; //pitch mapping
	s = (emotion*2)+20; //speed mapping
	
	sprintf(output, "espeak \"%s\" -a %i -p %i -s %i", input, (int)a, (int)p, (int)s);
	system(output); //run completed command
	return 0;
}
