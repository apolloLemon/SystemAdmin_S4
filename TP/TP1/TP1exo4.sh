find / -name \*.jpg;
find / -name '*.jpg' -o -name '*.gif' -size +10k;
find / -path /usr/share/icons -prune -o -name '*.jpg' -o -name '*.gif' -size +10k 2> /dev/null;
