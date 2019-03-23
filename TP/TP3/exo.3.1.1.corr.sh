#!/bin/bash

tableau=($(ls))

k=0

for i in $(seq 0 ${#tableau[@]}); do
	depJ=$(expr $i + 1)
	for j in $(seq $depJ ${#tableau[@]}); do
		k=$(expr $k + 1 ) 
		ci=${#tableau[i]}
		cj=${#tableau[j]}
		if [ $cj -lt $ci ] ; then 
			tmp=${tableau[$i]}
			tableau[i]=${tableau[j]}
			tableau[j]=$tmp
		fi
	done
done

for i in ${tableau[@]}; do
	echo $i
done

echo $k