#!/bin/bash
#PBS -N matrix
#PBS -o 98_log_files/prep.out
#PBS -l walltime=20:00:00
#PBS -l mem=15g
#####PBS -m ea 
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR



~/Scripts/get_fasta_alignedContig.py final_keep 09_assembly_stats/trinity.nolow.expression.fa >10_reference_final/trinity.filtered.fa
