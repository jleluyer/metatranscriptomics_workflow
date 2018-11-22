#!/bin/bash

for file in $(ls 08_count/htseq*)
do
	base=$(basename "$file")
	echo -e "genes\t$base" | cat - $file > $file.temp
        mv $file.temp "$file".trim
done
