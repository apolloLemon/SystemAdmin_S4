mkdir LINUX;
cd LINUX;
# cd ..;
pwd;
ls / >> fichier1;
touch .fichier2;
ls / ~ >> .fichier2;
# cd ~;
ls -l;
ls -al;
# ls / -alR; #il prends tres longtemps...
mkdir TP1;
cp fichier1 TP1/fichier1_copie;
mv .fichier2 TP1/;
mv .fichier2 ficher2;
mkdir ../UNIX; #si tu est dans LINUX
cp -R * ../UNIX/;
ln ../UNIX/fichier1 fichier1_ref_phys; ln -s ../UNIX/fichier1 fichier1_ref_symb;
ls -i ../UNIX ./;
rm TP1/fichier2;
rm -R ../UNIX;
#le lien physique fonctionne encore, mais le lien symbolique est casse'
ls -i fichier1_ref_phys fichier1_ref_symb; cat fichier1_ref_phys fichier1_ref_symb; 
which grep;
echo $USER;
man grep;
w;
ls -lR --block-size=M;
df -h;
chmod a+x .;
# 644 rw-r--r-- , 755 rwx-r-xr-x , 000 -------- , 711 rwx--x--x, 731 rwx-wx--x
chmod 644 .; #on ne peu plus y acceder