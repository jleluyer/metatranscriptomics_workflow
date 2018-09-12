#!/bin/bash
#PBS -N trimmomatic__BASE__
#PBS -o 98_log_files/trimmomatic__BASE__.out
#PBS -l walltime=02:00:00
#PBS -l mem=60g
#####PBS -m ea 
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR


TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
SCRIPT=$0
NAME=$(basename $0)
LOG_FOLDER="98_log_files"
cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

# module load
. /appli/bioinfo/trimmomatic/latest/env.sh

# Global variables

ADAPTERFILE="01_info_files/adapters.fasta"
NCPU=8
base=__BASE__
REPO="/scratch/home1/jleluyer/capamax"

trimmomatic PE -Xmx60G \
        -threads 8 \
        -phred33 \
        "$REPO"/02_data/"$base"_R1.fastq.gz \
        "$REPO"/02_data/"$base"_R2.fastq.gz \
        "$REPO"/03_trimmed/"$base"_R1.paired.fastq.gz \
        "$REPO"/03_trimmed/"$base"_R1.single.fastq.gz \
        "$REPO"/03_trimmed/"$base"_R2.paired.fastq.gz \
        "$REPO"/03_trimmed/"$base"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERFILE":2:20:7 \
        LEADING:20 \
        TRAILING:20 \
        SLIDINGWINDOW:30:30 \
        MINLEN:60 2> 98_log_files/log.trimmomatic.pe."$TIMESTAMP"   
