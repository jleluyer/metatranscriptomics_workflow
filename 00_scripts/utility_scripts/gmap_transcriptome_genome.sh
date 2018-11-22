#!/bin/bash
#PBS -N index
#PBS -o index.out
#PBS -l walltime=20:00:00
#PBS -l mem=30g
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR


# Global variables
DATA_FOLDER="/00_ressources/genomes/T_maritimum/"
INDEXED_GENOME_FOLDER="tmaritimum_index"
ANNOTATION_FOLDER="/01_projects/capamax/metatranscriptomics_workflow/test_visualizationTmar"
NCPUS=1
TRANSCRIPTOME="/01_projects/capamax/metatranscriptomics_workflow/test_visualizationTmar/sequence_Tmaritimum.fa"

# Align reads
cat "$TRANSCRIPTOME" | gmap -t "$NCPUS" \
        --dir "$DATA_FOLDER" \
        -d "$INDEXED_GENOME_FOLDER" \
        -f gff3_gene \
        --gff3-add-separators=0 \
        > "$ANNOTATION_FOLDER"/tmaritimum_transcriptome.gff3


