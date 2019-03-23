#for x in *.$1; do mv "$x" "${x%.$1}.$2"; done

for x in *.$1; do mv "$x" "${x/.$1/.$2}"; done