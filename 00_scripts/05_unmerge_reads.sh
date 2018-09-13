#!/bin/bash
#PBS -N unmerge_rna_db
#PBS -o 98_log_files/unmerge.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=20g
#####PBS -m ea 
#PBS -r n

cd $PBS_O_WORKDIR


. /appli/bioinfo/sortmerna/latest/env.sh


#usage sorterna
base=__BASE__
REPO="/scratch/home1/jleluyer/capamax/04_filtered_non_rna"
REPO_unmerge="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_unmerge"

unmerge-paired-reads.sh "$REPO"/"$base"_non_rna.fq "$REPO_unmerge"/"$base"_R1.fq "$REPO_unmerge"/"$base"_R2.fq


