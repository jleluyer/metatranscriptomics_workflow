#!/bin/bash
#PBS -N blastn
#PBS -o 98_log_files/blastn.conta.platax.out
#PBS -l walltime=20:00:00
#PBS -l mem=30g
#PBS -l ncpus=16
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR


# Module load

. module/blast/2.6.0/env.sh

# Global variables
DB="/00_ressources/transcriptomes/P_orbicularis/transcriptome_platax_40278.fa"

makeblastdb -in $DB -input_type 'fasta' -dbtype 'nucl'

cat 09_assembly_stats/trinity.raw.fa  |parallel -j 16 -k --block 10k --recstart '>' --pipe blastn -db $DB -query - -outfmt 6 -max_target_seqs 1 -evalue 1e-4 >blastn_conta_platax.txt

awk '{print $1}' blastn_conta_platax.txt|sort -u >list_remove_conta_platax.txt 
