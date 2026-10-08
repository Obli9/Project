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

	storage=$(awk '{print $5}' ~/storage.txt | grep -v Use | sed 's/%//g' | sort -nr | head -n 1)

	if [ "$storage" -ge 90 ]; then
		echo "Drive is over 90% full, please free up some space"
	else
		echo "Drive is under 90% full, no action needed"
	fi
	
}

file_check(){
	echo  "Please enter the path to the directory you want to check (example: /home/user/Documents): "
	read DIRECTORY
	DIRECTORY=ls $DIRECTORY


#Need to make directory to print content 
#one by one, and check if the file is empty or not. 
#If it is not empty, print the file name.
	for file in $DIRECTORY; do 
		if [ -s "$file" ]; then
			echo "File: $file is not empty" #why it not check the content of the file?
		fi
	done
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
