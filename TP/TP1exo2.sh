dmesg | tail -20;
dmesg | grep -ni linux | wc -l;
grep -s '\([0-9]\{1,3\}\.\)\{3\}\([0-9]\{1,3\}\)' /var/log/* | wc -l;
grep -os '\([0-9]\{1,3\}\.\)\{3\}\([0-9]\{1,3\}\)' /var/log/* | sort | uniq;