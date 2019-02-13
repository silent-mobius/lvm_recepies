#!/usr/bin/env bash

########################################################################
#Author  : br0k3ngl255
#Date    : 27.08.3017
#Purpose : setup disks for lvm usage.
#Version : 1.0.1
########################################################################

##vars :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#messages
msg_usage
msg_permissions="Please Escalate To Root Level"
msg_fdisk_start=""
msg_fdisk_error=""
msg_fdisk_end=""


#misc
line="#################################################################"
Time=1.5
Path="/dev"
#arrays
disk_array=($(ls /dev|grep -v sda|grep sd))

#funcs /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

usage(){}
permissions(){}

fdisk_lvm_change(){
	local disk=$1
	printf "%s" "$msg_fdisk_start"
	sleept $Time
	
	fdisk $disk << EEOF
n
p
1
1


t
8e
	
w	
	
EEOF
	printf "%s" "$msg_fdisk_end"
	sleep $Time
	}

####
#Main - _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _
#### 

if [[ $EUID != 0 ]];then
	msg_usage; usage
	msg_permissions; permissions
	exit $status
else

	for disk in ${disk_array}
		do
			fdisk_lvm_change $Path/$disk
		done

fi
