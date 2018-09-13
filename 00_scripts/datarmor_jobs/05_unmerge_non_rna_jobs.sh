#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/UNMERGE*sh

# launch scripts for Colosse
for file in $(ls /scratch/home1/jleluyer/capamax/04_filtered_non_rna/*.fq|sed 's/_non_rna.fq//g'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/05_unmerge_reads.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/UNMERGE_"$base".sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/UNMERGE*sh); do qsub $i; done


