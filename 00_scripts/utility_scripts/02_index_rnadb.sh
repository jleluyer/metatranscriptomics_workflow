#!/bin/bash
#PBS -N index_rna_db
#PBS -o 98_log_files/index_rnadb.out
#PBS -l walltime=10:00:00
#PBS -l mem=10g
#####PBS -m ea 
#PBS -r n

cd $PBS_O_WORKDIR

# module load
#sortmerna

#usage sorterna
repodb="/path/to.db/repo"

cd $repodb

indexdb_rna --ref sortmerna_db.fa,sortnerna_db.idx -m 5000
