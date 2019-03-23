#!/bin/bash
NomFichier=""
NomSortie=""

while [[ -n $1 ]] ; do
	case $1 in
		-fichier)
			NomFichier=$2;
			shift
			shift
			;;
		-sortie) 
			NomSortie=$2;
			shift
			shift
			;;
		-help)
			echo "non, lis le script"
			shift
			;;
	esac
done
echo $NomFichier
echo $NomSortie

for i in $NomFichier/*.jpg; do
	echo $i
	fulldate=$(exiftool -b -datetimeoriginal $i)
	year=${fulldate:0:4}
	month=${fulldate:5:2}
	day=${fulldate:8:2}


	if [ ${#year} -gt 0 ]
	then
		echo $year
		echo $month
		echo $day
		mkdir $NomSortie/$year
		mkdir $NomSortie/$year/$month
		mkdir $NomSortie/$year/$month/$day
		mv $i $NomSortie/$year/$month/$day/
	fi
done