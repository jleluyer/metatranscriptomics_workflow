#!/bin/bash
#PBS -N filter_rna_db
#PBS -o 98_log_files/filter_rnadb.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=60g
#PBS -l ncpus=12
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR

# module load
#sortmerna


#usage sorterna
repodb="/path/to/db/dir"
REPO="03_trimmed"
repo_rna="04_filtered_rna"
repo_non_rna="04_filtered_non_rna"
base=__BASE__
NCPU=12

sortmerna --ref "$repodb"/sortmerna_db.fa,"$repodb"/sortmerna_db.idx --reads "$REPO"/"$base"_combined.fq \
		--fastx --paired_in --aligned "$repo_rna"/"$base"_rna --other "$repo_non_rna"/"$base"_non_rna \
		--num_alignments 1 -a "$NCPU" 
