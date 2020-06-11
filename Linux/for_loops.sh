#!/bin/bash

num_list=$(echo {0..9})

Fav_States=('Nebraska' 'New Jersey' 'Georgia' 'Florida' 'California') 

Output=$(ls)

suids=$(find / -type f -perm /4000 2> /dev/null) 

#number print 
for num in ${num_list[@]};
 do
    if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ] 
	then 
	echo $num
fi
done

# print state 
for state in ${Fav_States[@]};
 do
  if [ $state = 'New York' ] 
	then 
	echo "New York Is the Best"
	else 
	echo "I'm not fond of New York"	
fi
done

# Print out each item in your variable 
for x in ${Output[@]};
	do
	echo $x
done

#Print SUID 
for suid in ${suids[@]};
do
	echo $suid
done
