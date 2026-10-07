#!/bin/bash

system_check(){
echo "--Checking the drive storage space--"

#Create a storage and append new one

touch ~/storage.txt


	

}


file_check(){

}

network_check(){

}

echo -e "Welcome to the all in one!\n"

echo -e "Please select which option:\n
1)Check System Health\n
2)Batch File Checker\n
3)Network Troubleshoot\n
4)Exit"

read -i OPTION

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


