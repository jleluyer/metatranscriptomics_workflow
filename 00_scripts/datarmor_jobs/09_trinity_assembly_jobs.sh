#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/ASSB*sh

# launch scripts for Colosse
for file in $(ls 03_trimmed/*host*fastq.gz|perl -pe 's/.f(ast)?q.gz//'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/06_assemble_trinity.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/ASSB_"$base".sh
done


#change jobs header

#Submit jobs
#for i in $(ls 00_scripts/datarmor_jobs/ASSB*sh); do qsub $i; done


