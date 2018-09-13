#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/PREDICT*sh

# launch scripts for Colosse
for file in $(ls /scratch/home1/jleluyer/capamax/04_filtered_non_rna_join/*|sed -e 's/.un[12]//g' -e 's/.join//g' |sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/07_fraggenescan.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/PREDICT_"$base".sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/PREDICT_*sh); do qsub $i; done


