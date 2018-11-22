#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/CDHIT*sh

# launch scripts for Colosse
for file in $(ls /scratch/home1/jleluyer/capamax/04_filtered_non_rna_predict/*ffn|sed -e 's/.join.ffn//g' |sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/08_cd-hit.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/CDHIT_"$base".sh
done

exit
#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/CDHIT_*sh); do qsub $i; done


