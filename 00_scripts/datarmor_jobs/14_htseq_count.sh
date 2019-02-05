#!/bin/bash


# Clean past jobs

rm 00_scripts/datarmor_jobs/HTSQ_*sh

for i in $(ls /scratch/home1/jleluyer/capamax/04_mapped/*.sorted.bam|sed -e 's/.sorted.bam//g'|sort -u)

do
base="$(basename $i)"

	toEval="cat 00_scripts/19_htseq_count.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/HTSQ_$base.sh
done


#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/HTSQ_*sh); do qsub $i; done


