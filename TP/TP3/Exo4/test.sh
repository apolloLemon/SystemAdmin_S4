m="*.*"
for i in src/*; do
	echo $i
	read m
	if grep m $i
	then 
		echo "motif"
	fi
done