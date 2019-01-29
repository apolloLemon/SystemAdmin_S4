#!/bin/bash
if [ -z $2 ] || [$2 -ne "a"]
then
	chmod u+x $1
else
	chmod a+x $1
fi