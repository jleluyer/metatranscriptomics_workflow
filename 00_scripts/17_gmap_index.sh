#!/bin/bash
#PBS -N gmap_index
#PBS -o 98_log_files/gmap_index.out
#PBS -l walltime=24:00:00
#PBS -m ea 
#PBS -l ncpus=1
#PBS -l mem=50g
#PBS -r n

TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
SCRIPT=$0
NAME=$(basename $0)
LOG_FOLDER="98_log_files"
cp $SCRIPT "$LOG_FOLDER"/"$TIMESTAMP"_"$NAME"

#move to present working dir
cd $PBS_O_WORKDIR

# Combined
## Host
#GENOMEFOLDER="/01_projects/capamax/metatranscriptomics_workflow/10_reference_final/"
#FASTA="/01_projects/capamax/metatranscriptomics_workflow/10_reference_final/final_filtered.fa"
#GENOME="filtered.transcriptome"

#gmap_build --dir="$GENOMEFOLDER" "$FASTA" -d "$GENOME" 2> 98_log_files/log.index."$TIMESTAMP"

GENOMEFOLDER="/00_ressources/transcriptomes/P_orbicularis/"
FASTA="/00_ressources/transcriptomes/P_orbicularis/transcriptome_platax_40278.fa"
GENOME="transcriptome_platax_index"

gmap_build --dir="$GENOMEFOLDER" "$FASTA" -d "$GENOME"
