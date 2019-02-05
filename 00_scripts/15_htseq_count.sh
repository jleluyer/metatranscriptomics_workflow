#!/usr/bin/env bash
#PBS -N htseq.__BASE__
#PBS -o 98_log_files/htseq.__BASE__.err
#PBS -l walltime=03:00:00
#PBS -m ea
#PBS -l ncpus=1
#PBS -l mem=30g
#PBS -r n


# Move to present working dir
cd $PBS_O_WORKDIR

#Global variables
DATAINPUT="/scratch/home1/jleluyer/capamax/04_mapped/platax"
DATAOUTPUT="08_count/platax"

GFF_FILE_symbiont="/00_ressources/transcriptomes/P_orbicularis/transcriptome_platax_40278.gff3"

#launch script
base=__BASE__

# for gene expression
htseq-count -f "bam" -s "no" -t "CDS" -i "Name" "$DATAINPUT"/"$base".sorted.bam "$GFF_FILE_symbiont" >>"$DATAOUTPUT"/htseq-count_"$base".txt

