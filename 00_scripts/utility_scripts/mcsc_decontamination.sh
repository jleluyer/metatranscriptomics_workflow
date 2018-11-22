#!/bin/bash
#PBS -N deconta
#PBS -o 98_log_files/log.decontaMcSC.out
#PBS -l walltime=20:00:00
#PBS -l mem=30g
#PBS -l ncpus=16
#PBS -q omp
#PBS -r n

. module/blast/2.6.0/env.sh


cd $PBS_O_WORKDIR
MCSC_decontamination.sh /01_projects/capamax/metatranscriptomics_workflow/01_info_files/mcsc.ini
