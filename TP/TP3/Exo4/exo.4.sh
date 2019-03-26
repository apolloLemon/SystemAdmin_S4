#!/bin/bash
NomFichier=""
NomSortie=""
DATE_FLAG="0"
MOTIF=""

while [[ -n $1 ]] ; do
	case $1 in
		-fichier)
			NomFichier=$2;
			shift
			;;
		-sortie) 
			NomSortie=$2;
			shift
			;;
		-help)
			echo "non, lis le script"
			;;
		-dateall)
			DATE_FLAG="1"
			;;
		-motif)
			MOTIF=$2
			shift
			;;
	esac
	shift
done
#echo $NomFichier
#echo $NomSortie

#for i in $NomFichier/*.jpg; do
for i in $NomFichier/*; do
	if grep $MOTIF $i
	then 
		echo "motif"
	fi
	echo $i
	fulldate=$(exiftool -b -datetimeoriginal $i)
	#if [ -z fulldate -a DATE_FLAG ]
	#if [[ ${#fulldate} -le 0 ]] && [ DATE_FLAG ];
	#if [ ("$fulldate" == "") && ("$DATE_FLAG"=="true") ]
	#if [ "$fulldate" == "" -a DATE_FLAG ]
	#if [ ${#fulldate} -le 0 ] 
	if [ "$DATE_FLAG" -eq "1" ] && [ ${#fulldate} -le 0 ]
	then
		echo "Enter YYYY/MM/DD"
		read fulldate
	fi

	year=${fulldate:0:4}
	month=${fulldate:5:2}
	day=${fulldate:8:2}

	#if [ -n $year ] # didn't work because year != $year # still doesn't work..
	if [ ${#year} -gt 0 ]
	then
		echo $year
		echo $month
		echo $day
		#mkdir $NomSortie/$year #removed because -p
		#mkdir $NomSortie/$year/$month
		mkdir -p $NomSortie/$year/$month/$day
		mv $i $NomSortie/$year/$month/$day/
	fi
done