#!/bin/bash
#PBS -N index_rna_db
#PBS -o 98_log_files/merge.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=30g
#####PBS -m ea 
#PBS -r n

cd $PBS_O_WORKDIR

#module load
#sortmerna

#usage sorterna
base=__BASE__
REPO="03_trimmed"

zcat "$REPO"/"$base"_R1.paired.fastq.gz >"$REPO"/"$base"_R1.paired.fastq
zcat "$REPO"/"$base"_R2.paired.fastq.gz >"$REPO"/"$base"_R2.paired.fastq


merge-paired-reads.sh "$REPO"/"$base"_R1.paired.fastq "$REPO"/"$base"_R2.paired.fastq "$REPO"/"$base"_combined.fq

rm "$REPO"/"$base"_R1.paired.fastq
rm "$REPO"/"$base"_R2.paired.fastq


