#!/bin/bash


# Clean past jobs

rm 00_scripts/datarmor_jobs/01_transcriptome_assembly/ABD_*sh


# launch scripts for Colosse
for file in $(cat 01_info_files/list_ind_assembly.txt |sed -e 's/.paired.fastq.gz//' -e 's/_R[12]//g'|sort -u)
do

base=$(basename "$file")

	toEval="cat 00_scripts/13_transcripts_abundance.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/ABD_$base.sh
done

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/ABD_*sh); do qsub $i; done


