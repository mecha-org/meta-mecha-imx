#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

#define WRITE_MODE  0x00
#define READ_MODE   0x01
#define BANK_MODE   0x02

#define REG_APEX_CONFIG4       0x43
#define REG_ACCEL_CONFIG0      0x50
#define REG_PWR_MGMT0          0x4E
#define REG_APEX_CONFIG0       0x56
#define REG_SIGNAL_PATH_RESET  0x4B
#define REG_INT_SOURCE6        0x4D

#define REG_INT_STATUS3        0x38

char writeData[20];
char readData[20];
char bytes_written;
char bytesRead;
char fd;

char *device_file = "/sys/bus/iio/devices/iio:device2/register_rw";

void read_int_status()
{
	fd = open(device_file, O_RDONLY);
	if (fd == -1) {
		perror("Failed to open sysfs file");
	}

	bytesRead = read(fd, readData, sizeof(readData));
	if (bytesRead < 0) {
		perror("Read error");
	}
	printf("%s\n", readData);
	sleep(1);

	close(fd);
}
int main() 
{
	fd = open(device_file, O_WRONLY);
	if (fd == -1) {
		perror("Failed to open the device file");
		return 1;
	}
	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", BANK_MODE, 0x04, REG_APEX_CONFIG4, 0x00);

	bytes_written = write(fd, writeData, strlen(writeData));
	if (bytes_written == -1) {
		perror("Failed to write to the device file");
		close(fd);
		return 1;
	}

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_ACCEL_CONFIG0, 0x49);

	bytes_written = write(fd, writeData, strlen(writeData));
	if (bytes_written == -1) {
		perror("Failed to write to the device file");
		close(fd);
		return 1;
	}

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_PWR_MGMT0, 0x02);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                    
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_APEX_CONFIG0, 0x02);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                       
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_SIGNAL_PATH_RESET, 0x20);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                       
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_SIGNAL_PATH_RESET, 0x40);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                       
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", WRITE_MODE, 0x00, REG_APEX_CONFIG0, 0x12);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                       
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", BANK_MODE, 0x04, REG_INT_SOURCE6, 0x08);

	bytes_written = write(fd, writeData, strlen(writeData));                            
	if (bytes_written == -1) {                       
		perror("Failed to write to the device file");
		close(fd);                                   
		return 1;                                    
	}             

	snprintf(writeData, sizeof(writeData), "%02x%02x%02x%02x", READ_MODE, 0x00, REG_INT_STATUS3, 0x00);

	bytes_written = write(fd, writeData, strlen(writeData));                                
	if (bytes_written == -1) {                                                    
		perror("Failed to write to the device file");
		close(fd);                                                                
		return 1;                                                                 
	}             
	close(fd);
	sleep(2);

	while(1)
	{
		read_int_status();
	}
	return 0;
}

