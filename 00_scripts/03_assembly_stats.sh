#!/bin/bash
#PBS -N assembly.stats
#PBS -o 98_log_files/assembly.stats.out
#PBS -l walltime=01:00:00
#PBS -l mem=5g
#PBS -r n

cd $PBS_O_WORKDIR
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
SCRIPT=$0
NAME=$(basename $0)
LOG_FOLDER="98_log_files"
cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

INPUTFILE="/scratch/home1/jleluyer/capamax/05_trinity_assembly_200.Trinity.fasta"
OUTPUTFILE="09_assembly_stats/raw_transcriptome.txt"

#Check stats
TrinityStats.pl "$INPUTFILE" > "$OUTPUTFILE" 2>&1 | tee 98_log_files/"$TIMESTAMP"_assemblystats.log
