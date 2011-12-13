#include "serial_utils.h"
#include <stdio.h> // standard input / output functions
#include <string.h> // string function definitions
#include <unistd.h> // UNIX standard function definitions
#include <fcntl.h> // File control definitions
#include <errno.h> // Error number definitions
#include <termios.h> // POSIX terminal control definitionss
#include <time.h>   // time calls
#include <ctype.h>

int open_port(const char id)
{
    int fd; // file description for the serial port
    
    for(int i = 0; i < 10; i++) {
	    char dev_name[100];
	    sprintf(dev_name, "/dev/ttyUSB%d", i);

	    fd = open(dev_name, O_RDWR | O_NOCTTY);
	    if(fd == -1) // if open is unsucessful
	    {
		printf("Unable to open %s. \n", dev_name);
		goto failed;
	    }
	    else
	    {
		printf("port open: %s.\n", dev_name);
		fd = configure_port(fd);
		
		// Allow arduino to run past bootloader
		sleep(3);
		printf("Requesting identity...\n");
		write_data(fd, "I", 1);
		
		// Wait for arduino reply
		sleep(1);

		char response[100]; // Response will be of form "iX" where X is the
				    // arduino type character (e.g. 'F' for freduino)
		if(read_data(fd, response, 100) >= 2) {
			printf("Device type: %c\n", response[1]);
			// Compare upper case because serial has a strange
			// habit of changing message cases... weird
			if(toupper(id) == toupper(response[1])) {
				printf("Found correct device!\n");
			} else {
				printf("Wrong device!\n");
				goto failed;
			}
		} else {
			printf("No device type found...");
			goto failed;
		}
		break;
	    }
failed:
	close(fd);
    }
    
    return(fd);
} //open_port

int configure_port(int fd)      // configure the port
{
    struct termios port_settings;      // structure to store the port settings in
    
    cfsetispeed(&port_settings, B57600);    // set baud rates
    cfsetospeed(&port_settings, B57600);
    
    port_settings.c_cflag &= ~PARENB;    // set no parity, stop bits, data bits
    port_settings.c_cflag &= ~CSTOPB;
    port_settings.c_cflag &= ~CSIZE;
    port_settings.c_cflag |= CS8;
	port_settings.c_cflag &= ~CRTSCTS;	// Disable hardware flow control.
	port_settings.c_iflag &= ~IXON;		// Disable software flow control
	port_settings.c_iflag &= ~IXOFF;
    
    tcsetattr(fd, TCSANOW, &port_settings);    // apply the settings to the port
    return(fd);
    
} //configure_port


int write_data(int fd, const char * data, int len)   // query modem with an AT command
{
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(fd, &fds);
	struct timeval timeout;
	timeout.tv_sec = 1;
	timeout.tv_usec = 0;
	int i;
	for (i = 0; i<len; i++) {   
    	
		write(fd, &(data[i]), 1);  //Send data
	}
	return i;
} //query_modem

int read_data(int fd, char *data, int len)
{
	int length = read(fd, data, len);
	if(length > 0) {
		data[length] = '\0';
	}
	return length;
} //read_data
