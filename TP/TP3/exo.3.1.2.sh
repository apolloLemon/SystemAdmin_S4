IFS=$'\r\n'

while read ai; do
	echo -n "<"
	echo -n $ai
	echo ">"
done < $1