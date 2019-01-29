#!/bin/bash
echo -e " \n \t On déclare la variable locale v1 \n "
v1=quelquechose
echo -e " \t La valeur de v1 est : $v1 \n "
echo -e " \t Entrez la nouvelle valeur de v1 : "
read v1
if [[ -z $v1 ]]; then
echo " La valeur de v1 est vide "
else
echo " Nouvelle valeur de v1 : $v1 "
fi