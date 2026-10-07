#!/bin/bash

system_check(){
	echo "--Checking the drive storage space--"

	#Create a storage.txt and append new one, 
	#then check if it exists, if it does append 
	#new storage info, if not create it and add the storage info
	if [ -f ~/storage.txt ]; then
		echo "storage.txt exists, appending new storage info"
		df -h > ~/storage.txt
	else
		echo "storage.txt does not exist, creating it"
		touch ~/storage.txt
		df -h > ~/storage.txt
	fi

#got error, need to correct later
if [ $(cat ~/storage.txt | awk '{print $5}') -gt 90 ]; then
	echo "Drive is over 90% full, please free up some space"
else
	echo "Drive is under 90% full, no action needed"
fi
	
}

#Using : for placeholder so that the 
#script can be run without errors, but the function does nothing
file_check(){
	:
}

network_check(){
	:
}

echo -e "Welcome to the all in one!\n"

echo -e "Options:\n1)Check System Health\n2)Batch File Checker\n3)Network Troubleshoot\n4)Exit"

read -p "Please select an option: " OPTION

case $OPTION in
1)
	system_check
	exit;;
2)
	file_check
	exit;;
3)
	network_check
	exit;;
*)
	exit;;
esac
