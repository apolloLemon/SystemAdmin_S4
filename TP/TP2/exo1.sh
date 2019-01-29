ssh -Y mcoyle@janus.info.univ-angers.fr;
df ~ -h;
scp /home/melon/University/S4/SystemAdmin/TP/TP2/exo1.sh mcoyle@janus.info.univ-angers.fr:~;
scp -r /home/melon/University/S4/SystemAdmin/TP/TP2/ mcoyle@janus.info.univ-angers.fr:~/TP2/;
ssh -X -Y mcoyle@janus.info.univ-angers.fr;
ssh-keygen;
ssh-copy-id;

#aller dans ~/.ssh/authorized_keys et retirer la ligne avec la clef