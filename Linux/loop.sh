#!bin/bash
## Greater than
if [ 6 -gt 5 ]
then 
	echo "Greater than test passed"
	else 
	echo "This does not make sense"
exit
fi

## Less than
if [ 15 -lt 13 ]
then
	echo "Less than test failed"
	else
	echo "Less than test passed" 
exit 
fi 

##Test && 
if [ 2 -gt 1 ]&&[ 3 -lt 4 ]
 then
	echo "Haye Haye"
	else 
	echo "Input Error" 
exit
fi
 
## Not Equal To
if [ $USER != 'sysadmin' ] 
	then 
	echo "You are not the sysadmin"
	exit
fi

