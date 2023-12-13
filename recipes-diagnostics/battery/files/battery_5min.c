#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<fcntl.h>
#include <time.h>

int main() {

//printf("-------------------------------------------------\n");

	char capacity[4];
	char voltage[8];
	char current[8];
	char temp[6];

	FILE *fcapacity;
	FILE *fvoltage_now;
	FILE *fcurrent_now;
	FILE *ftemp_now;

	FILE *battery_data = fopen("battery_data_5min.txt", "a");
	if (battery_data == NULL) {
		perror("Error opening file");
		return 1;
	}

while(1){
	fcapacity = fopen("/sys/class/power_supply/bq27441-0/capacity", "r");
	fread(capacity, sizeof(char), 4, fcapacity);
    int b1;
    sscanf(capacity, "%d", &b1);
	fclose(fcapacity);

    fvoltage_now = fopen("/sys/class/power_supply/bq27441-0/voltage_now", "r");
	fread(voltage, sizeof(char), 8, fvoltage_now);
    float b2;
    sscanf(voltage, "%f", &b2);
	fclose(fvoltage_now);

	fcurrent_now = fopen("/sys/class/power_supply/bq27441-0/current_now", "r");
	fread(current, sizeof(char), 8, fcurrent_now);
    float b3;
    sscanf(current, "%f", &b3);
	fclose(fcurrent_now);

	ftemp_now = fopen("/sys/class/thermal/thermal_zone0/temp", "r");
	fread(temp, sizeof(char), 6, ftemp_now);
    int b4;
    sscanf(temp, "%d", &b4);
	fclose(ftemp_now);

	//printf(" X axis : %s Y axis : %s Z axis : %s", buffer1, buffer2, buffer3);
	//system("date ");

    time_t current_time;
    struct tm *time_info;
    char time_string[9]; // HH:MM:SS + null terminator
    time(&current_time);
    time_info = localtime(&current_time);
    strftime(time_string, sizeof(time_string), "%T", time_info);	
    //printf("Current time: %s\n", time_string);
	
	printf(" Battery %%: %d  V: %3f  A: %3f Temp: %d Current time: %s\n", b1, b2/1000000, b3/1000000, b4, time_string);
	printf("\n");

	fprintf(battery_data, " Battery %%: %d  V: %3f  A: %3f Temp: %d Current time: %s\n", b1, b2/1000000, b3/1000000, b4, time_string);
	fflush(battery_data);
	
	memset(capacity,0,sizeof(capacity));
	memset(current,0,sizeof(current));
	memset(voltage,0,sizeof(voltage));
	memset(temp, 0, sizeof(temp));

    //usleep(300000000);
	sleep(300);
}
return 0;
}