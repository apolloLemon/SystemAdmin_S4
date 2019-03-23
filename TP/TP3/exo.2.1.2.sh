#!/bin/bash
NomFichier=""
NomSortie=""
Recursif=0

while [[ -n $1 ]] ; do
	case $1 in
		-r) 
			Recursif=1
			shift
			;;
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
echo " Récursif : $Recursif "
echo " Fichier d'entrée : $NomFichier "
echo " Fichier de sortie : $NomSortie "