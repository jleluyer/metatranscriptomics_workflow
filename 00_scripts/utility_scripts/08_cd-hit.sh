#!/bin/bash
#PBS -N cdhit_rna_db
#PBS -o 98_log_files/cdhit.__BASE__.out
#PBS -l walltime=20:00:00
#PBS -l mem=55g
#PBS -r n


#usage sorterna
base=__BASE__
REPO_predict="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_predict"
REPO_cluster="/scratch/home1/jleluyer/capamax/04_filtered_non_rna_cluster"

# Global variables
cd-hit-est -i "$REPO_predict"/"$base".join.ffn -o "$REPO_cluster"/"$base"_cluster.fa -c 0.9 -s 0.9 -M 50000


