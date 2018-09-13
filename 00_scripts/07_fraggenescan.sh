#!/bin/bash
#PBS -N predict_rna_db
#PBS -o 98_log_files/predict.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=20g
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR

#usage sorterna
base=__BASE__
REPO_predict="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_predict"
REPO_fastqjoin="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_join"


FragGeneScan.pl -s "$REPO_fastqjoin"/"$base".un1 -o "$REPO_predict"/"$base".un1 -0 -t illumina_5 -p 10

FragGeneScan.pl -s "$REPO_fastqjoin"/"$base".un2 -o "$REPO_predict"/"$base".un2 -0 -t illumina_5 -p 10

FragGeneScan.pl -s "$REPO_fastqjoin"/"$base".join -o "$REPO_predict"/"$base".join -0 -t illumina_5 -p 10


# combin by individuals
cat "$REPO_predict"/"$base".join "$REPO_predict"/"$base".un2 "$REPO_predict"/"$base".un1 >"$REPO_predict"/"$base".combined

