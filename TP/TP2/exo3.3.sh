#!/bin/bash
if [ -z $2 ]
then
	echo $(($1*$1))
else
	#for i in $(eval echo {$1..$2})
	for ((i=$1;i<=$2;i++))
	do
		echo $i"^2 = "$(($i*$i))
	done
fi