#!/bin/bash
#PBS -N diamond
#PBS -o diamond.out
#PBS -l walltime=20:00:00
#PBS -l mem=30g
#PBS -l ncpus=16
#PBS -q omp
#PBS -r n

. module/blast/2.6.0/env.sh


cd $PBS_O_WORKDIR

# Global variables
REFSEQ_bact="/00_ressources/refseq/refseq.batceria.fna"
TRANSCRIPTOME="02_data/test.fastq.gz"
BANK="/00_ressources/uniref50/Uniprot_Uniref5000"
diamond makedb --in $BANK -d uniref50_diamond

exit
diamond blastn --more-sensitive -d refseq_bact_diamond -p 16 -q $TRANSCRIPTOME -f 6 -k 1 -e 1e-4 -o diamtest_refseqbact_e-4.txt

