#!/bin/bash
clear
while [[ 1 ]] ; do
	echo -e "\\n\\n\\n Menu"
	echo " Afficher date 1 "
	echo " Nombre personnes connectees 2 "
	echo " Taille disponible sur dique 3 "
	echo " Sortie 0 "
	echo -n " Choix : "
	read choix ;
	echo " "
	case $choix in 
		1) date +%Y-%m-%d;;
		2) w ;;
		3) df -h -k / --block-size=1G --output=source,avail ;;
		0) exit ;;
		*) echo " Merci de saisir un entier entre 0 et 5 " ;;
		esac
done