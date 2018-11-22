#!/bin/bash


# Clean past jobs

rm 00_scripts/datarmor_jobs/GSNAP_*sh


# launch scripts for Colosse
for file in $(ls /scratch/home1/jleluyer/capamax/03_trimmed/*.paired.fastq.gz|sed -e 's/_R[12].paired.fastq.gz//g'|sort -u)
do

base=$(basename "$file")

	toEval="cat 00_scripts/20_gsnap_platax.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/GSNAP_$base.sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/GSNAP_*sh); do qsub $i; done


