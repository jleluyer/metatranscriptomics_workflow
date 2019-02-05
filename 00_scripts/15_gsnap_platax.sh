#!/bin/bash
#PBS -N gsnap.trans.__BASE__
#PBS -o gsnap.trans.__BASE__.err
#PBS -l walltime=24:00:00
#PBS -l mem=50g
#####PBS -m ea
#PBS -l ncpus=12
#PBS -q omp
#PBS -r n


. module/samtools/1.4.1/env.sh

# Global variables

DATAINPUT="/scratch/home1/jleluyer/capamax/03_trimmed"
DATAOUTPUT="/scratch/home1/jleluyer/capamax/04_mapped/platax"

#For combined
#GENOMEFOLDER_combined="10_reference_final"
#GENOME_combined="filtered.transcriptome"


GENOMEFOLDER="/00_ressources/transcriptomes/P_orbicularis/"
GENOME="transcriptome_platax_index"
platform="Illumina"

#move to present working dir
cd $PBS_O_WORKDIR

base=__BASE__


####################################################################
################## combined ########################################
####################################################################
    # Align reads
#    echo "Aligning $base"

    gsnap --gunzip -t 12 -A sam --min-coverage=0.95 \
        --dir="$GENOMEFOLDER" -d "$GENOME" \
        -o "$DATAOUTPUT"/"$base".combined.sam \
        --max-mismatches=1 \
        --read-group-id="$base" \
         --read-group-platform="$platform" \
        "$DATAINPUT"/"$base"_R1.paired.fastq.gz "$DATAINPUT"/"$base"_R2.paired.fastq.gz

# Create bam file
    echo "Creating bam for $base"
    samtools view -Sb -q 15 -F 4 -F 256 -f 2 \
        "$DATAOUTPUT"/"$base".combined.sam >"$DATAOUTPUT"/"$base".bam

     echo "Creating sorted bam for $base"
        samtools sort -n "$DATAOUTPUT"/"$base".bam -o "$DATAOUTPUT"/"$base".sorted.bam
        samtools index "$DATAOUTPUT"/"$base".sorted.bam

#clean up

rm "$DATAOUTPUT"/"$base".bam
rm "$DATAOUTPUT"/"$base".combined.sam
