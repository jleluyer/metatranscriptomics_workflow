#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/MERGE*sh

# launch scripts for Colosse
for file in $(ls 03_trimmed/*.paired.fastq.gz|sed 's/_R[12].paired.fastq.gz//g'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/03_merge_pe_reads.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/MERGE_"$base".sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/MERGE*sh); do qsub $i; done


