#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/FILTER*sh

# launch scripts for Colosse
for file in $(ls 03_trimmed/*_combined.fq|sed 's/_combined.fq//g'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/04_fitering_rRna.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/FILTER_"$base".sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/FILTER*sh); do qsub $i; done


