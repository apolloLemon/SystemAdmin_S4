#!/bin/bash
clear
essai=1 ; #nombre qui compte les tentatives d'executions
while [[ 1 ]] ; do
	echo -e "\\n\\n\\n Menu - Essai : $essai "
	echo " Afficher le répertoire courant 1 "
	echo " Lister les fichiers 2 "
	echo " Informations sur un fichier 3 "
	echo " Changement de répertoire 4 "
	echo " n premiè res lignes d'un fichier 5 "
	echo " Sortie 0 "
	echo -n " Choix : "
	read choix ;
	echo " "
	case $choix in
		1) pwd ;;
		2) ls ;;
		3) echo -n " Path : ";read path;./exo3.4.sh $path;; # à compléter
		4) echo -n " Path : "; read path; cd $path;; # à compléter
		5) echo -n " lignes :";read lignes; echo -n " Path: ";read path; head -n $lignes $path;; # à compléter
		0) exit ;;
		*) echo " Merci de saisir un entier entre 0 et 5 " ;;
		esac
		essai=$(( essai + 1 ));
done