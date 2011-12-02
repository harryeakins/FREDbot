#include <stdio.h> // standard input / output functions
#include <string.h> // string function definitions
#include <unistd.h> // UNIX standard function definitions
#include <fcntl.h> // File control definitions
#include <errno.h> // Error number definitions
#include <termios.h> // POSIX terminal control definitionss
#include <time.h>   // time calls

int open_port(void)
{
    int fd; // file description for the serial port
    
    fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_NDELAY);
    
    if(fd == -1) // if open is unsucessful
    {
        //perror("open_port: Unable to open /dev/ttyS0 - ");
        printf("open_port: Unable to open /dev/ttyS0. \n");
    }
    else
    {
        fcntl(fd, F_SETFL, 0);
        printf("port is open.\n");
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

int write_data(int fd, unsigned char * data, int len)   // query modem with an AT command
{
    //Create byte array
   // unsigned char send_bytes[] = { 0xbe, 0xef, 0x03, 0x06, 0x00, 0x19, 0xd3, 0x02, 0x00, 0x00, 0x60, 0x00, 0x00};
   // unsigned char send_bytes[] = {0xbe, 0xef, 0x03, 0x06, 0x00, 0xba, 0xd2, 0x01, 0x00, 0x00, 0x60, 0x01, 0x00};
	char randomshit[1];
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(fd, &fds);
	struct timeval timeout;
	timeout.tv_sec = 1;
	timeout.tv_usec = 0;
	for (int i = 0; i<len; i++) {   
	   	while (0 != select(1, &fds, 0, 0, &timeout)) {
   			read(fd, randomshit, 1);
		}
    	
		write(fd, &(data[i]), 1);  //Send data
	//	sleep(1);
		printf("Wrote the bytes. \n");
	}
    /*
    // do the select
    n = select(fd + 1, &rdfs, NULL, NULL, &timeout);
    
    // check if an error has occured
    if(n < 0)
    {
        perror("select failed\n");
    }
    else if (n == 0)
    {
        puts("Timeout!");
    }
    else
    {
        printf("\nBytes detected on the port!\n");
    }
    */
    return 0;
    
} //query_modem


/*
        int fd = open_port();
        configure_port(fd);
        query_modem(fd, data);
        close(fd);
*/


