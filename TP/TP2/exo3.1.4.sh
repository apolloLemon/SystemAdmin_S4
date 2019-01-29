#!/bin/bash
echo -e " \\ n \\ t On déclare la variable locale v1 \\ n "
v1 = quelque chose
while [[ -z $v1 ]] 
do
echo -e " \\ t Entrez la nouvelle valeur de v1 : "
read v1
done
echo " Nouvelle valeur de v1 : $v1 "