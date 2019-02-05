#!/bin/bash
#PBS -N predict_rna_db
#PBS -o 98_log_files/predict.__BASE__.out
#PBS -l walltime=10:00:00
#PBS -l mem=20g
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n

cd ~/softwares/FragGeneScan/

#usage sorterna
REPO_predict="scratch/capamax/05_predict/gene_prediction_transcriptome.fa"
REPO_transcriptome="/01_projects/capamax/metatranscriptomics_workflow/10_reference_final/trinity.filtered.fa"

./run_FragGeneScan.pl -genome="$REPO_transcriptome" -out="$REPO_predict" -complete=1 -train=illumina_5 -threads=8

