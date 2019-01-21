tar -cvzf archivelog.tar.gz /var/log/*;
tar -tf archivelog.tar.gz;
du archivelog.tar.gz;
gunzip archivelog.tar.gz | bzip2 > archivelog.tar.bz2 ;
tar -xvjf archivelog.tar.bz2;