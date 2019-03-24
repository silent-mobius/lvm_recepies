#!/usr/bin/env bash

###############################################################################
#created by 	:	br0k3ngl255
#purpose	:	automate lvm setup through a menu like system
#date		:	01:03:2019
#version	:	1.0.0
###############################################################################


####Vars =====================================================================
msg_missing_disk="physical disk name missing --> "
msg_provide_disk="please provide name -->"
msg_unexpected_error="Unexpected Error"
msg_volume_group_error=""
####Fucntions  ()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()
lv_create(){
	local var=$1
	
	
	}
	
vg_create(){
	local var=$1
	while [ $var == "" ]
		do
			printf "%s \n" "$msg_volume_group_error"
		done
	
	}

pv_create(){
	local var=$1
	while [ $var == "" ]
		do
			printf "%s \n"  "$msg_missing_disk"
			read -p $msg_provide_disk var
		done
	if [ -n $var ];then
			pvcreate $path/$var
	else
		printf "%s \n" "$msg_unexpected_error"
	fi
	}

####
#Main ()
###
