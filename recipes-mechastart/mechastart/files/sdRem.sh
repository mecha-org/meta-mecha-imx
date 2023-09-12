#!/bin/bash 
if [ "$1" == "-d" -o "$1" == "--debug" ]; then
	debug=1
	debug_head="[SD_REMOVE]"
	debug_path="/home/root/data/data/debug/sdRem.log"
fi

debug_print() {
	if [[ $debug -eq 1 ]]; then
		echo "${debug_head} ${1}" >> $debug_path
	fi
}

ret=0
check_error() {
	ret=$?
	if [[ $ret -ne 0 ]]; then
		dbg="Command failed to execute"
		debug_print "${dbg}"
#		exit $ret
	fi
}

sleep 1                                  
sdPath=$(find /dev -name "mmcblk1p[0-9]")

# Make mount point for SD Card
if [ -z $sdPath ]; then
	if [ -d "/home/root/sdCard" ]; then
		umount -f /home/root/sdCard
		sleep 1
		rm -rf /home/root/sdCard
	fi
	umount -f $sdPath
fi

otgPath=$(find /dev -name "sd[a-z]")

# Make mount point for OTG
if [ -z $otgPath ]; then
	if [ -d "/home/root/otgPD" ]; then
		umount -f /home/root/otgPD
		sleep 1
		rm -rf /home/root/otgPD
	fi
	umount -f $otgPath
fi
exit 0
