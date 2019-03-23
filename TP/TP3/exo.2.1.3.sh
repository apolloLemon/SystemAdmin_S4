num=$1
len=${#num}

i=0
while [[ $i -lt $len ]] ; do
	j=0
	chr=${num:$i:1} #extract char[i]
	while [[ $j -lt chr ]] ; do #add stars up to i
		echo -n "*"
		j=$j+1
	done
	echo ""
	i=$i+1
done