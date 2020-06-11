#!/bin/bash

echo "Om Namah Shivay" && echo "$now"

echo "$USER"

hostname -i | awk '{print $1}'

output=$HOME/Documents/sys_info.txt

ipaddress=$(ip addr | grep inet | tail - 2 | head -1)

findsuid=$(find / -type f -perm /4000)

# check if directory exists 
If [ !-d ~$HOME/research ] 
then
	mkdir ~$HOME/research
fi
 
# check for the file in directory 
If [ -f $output ] 
then  
	rm $output  
fi 

# check is script is being run as sudo 
if [ $USER='root' -eq 0 ]
then 
	echo  "please dont run script as sudo"
	exit 
fi 



