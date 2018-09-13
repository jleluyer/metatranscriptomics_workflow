#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/JOIN*sh

# launch scripts for Colosse
for file in $(ls 04_filtered_non_rna_unmerge/*.fq|sed 's/_R[12].fq//g'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/06_fastq_join_nonrna.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/JOIN_"$base".sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/JOIN_*sh); do qsub $i; done


