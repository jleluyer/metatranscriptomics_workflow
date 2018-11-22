#!/bin/bash
#PBS -N predict_rna_db
#PBS -o 98_log_files/predict.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=20g
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n


cd home/softwares/FragGeneScan/

#usage sorterna
base=__BASE__
REPO_predict="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_predict"
REPO_fastqjoin="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_join"

#seqtk seq -A "$REPO_fastqjoin"/"$base"un1 >"$REPO_fastqjoin"/"$base"un1.fa
#seqtk seq -A "$REPO_fastqjoin"/"$base"un2 >"$REPO_fastqjoin"/"$base"un2.fa
#seqtk seq -A "$REPO_fastqjoin"/"$base"join >"$REPO_fastqjoin"/"$base"join.fa

#run_FragGeneScan.pl -genome="$REPO_fastqjoin"/"$base"un1.fa -out="$REPO_predict"/"$base".un1 -complete=0 -train=illumina_5 -thread=10

#run_FragGeneScan.pl -genome="$REPO_fastqjoin"/"$base"un2.fa -out="$REPO_predict"/"$base".un2 -complete=0 -train=illumina_5 -thread=10

run_FragGeneScan.pl -genome="$REPO_fastqjoin"/"$base"join.fa -out="$REPO_predict"/"$base".join -complete=0 -train=illumina_5 -thread=10

# combin by individuals
#cat "$REPO_predict"/"$base".join.faa "$REPO_predict"/"$base.fa".un2.faa "$REPO_predict"/"$base".un1.faa >"$REPO_predict"/"$base".combined.fna

rm $REPO_predict"/"$base"*tmp*

