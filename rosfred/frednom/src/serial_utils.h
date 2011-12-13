int open_port(const char id);
int configure_port(int fd);
int write_data(int fd, const char * data, int len);
int read_data(int fd, char * data, int len);

