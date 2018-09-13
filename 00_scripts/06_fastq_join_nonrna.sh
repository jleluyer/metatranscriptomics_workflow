#!/bin/bash
#PBS -N fastq_rna_db
#PBS -o 98_log_files/fastq.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=20g
#####PBS -m ea 
#PBS -r n

cd $PBS_O_WORKDIR

#usage sorterna
base=__BASE__
REPO_unmerge="04_filtered_non_rna_unmerge"
REPO_fastqjoin="04_filtered_non_rna_join"

fastq-join -p 8 -m 6 "$REPO_unmerge"/"$base"_R1.fq "$REPO_unmerge"/"$base"_R2.fq -o "$REPO_fastqjoin"/"$base"
