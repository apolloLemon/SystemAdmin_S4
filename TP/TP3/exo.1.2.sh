#!/bin/bash
IFS=$'\r\n'
for ai in $(find ~ -size +5M \( -iname "*.jpg" -o -iname '*.gif' \) -exec echo {} \;); do
	#du -h "$ai"
	echo $ai
done