#!/bin/bash
clear
essai =1 ;
while [[ 1 ]] ; do
	echo -e " \\ n \\ n \\ n Menu - Essai : $essai "
	echo " Afficher le r é pertoire courant 1 "
	echo " Lister les fichiers 2 "
	echo " Informations sur un fichier 3 "
	echo " Changement de r é pertoire 4 "
	echo " n premi è res lignes d'un fichier 5 "
	echo " Sortie 0 "
	echo -n " Choix : "
	read choix ;
	echo " "
	case $choix in
		1) pwd ;;
		2) ls ;;
		3) ;; # à compléter
		4) ;; # à compléter
		5) ;; # à compléter
		0) exit ;;
		*) echo " Merci de saisir un entier entre 0 et 5 " ;;
		esac
		essai=$(( essai + 1 ));
done