#!/bin/bash
#PBS -N GetOrf
#PBS -o 98_log_files/getorf.out
#PBS -l walltime=20:00:00
#PBS -l mem=10g
#####PBS -m ea
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR


#Global variables
INPUT="09_assembly_stats/trinity.raw.fa"

TransDecoder.LongOrfs -t $INPUT 2>&1 | tee 98_log_files/transdecoder_getorf.log 
