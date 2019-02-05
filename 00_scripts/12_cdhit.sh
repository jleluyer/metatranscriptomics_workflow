#!/bin/bash
#PBS -N cdhit
#PBS -o 98_log_files/cdhit.out
#PBS -l walltime=30:00:00
#PBS -l mem=200g
#PBS -l ncpus=20
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR


# Module load
QUERY="10_reference_final/temp.fraggene.fa"

cd-hit-est -i $QUERY -o 10_reference_final/trinity.frag.cdhit.fa -c 0.9 -T 20

