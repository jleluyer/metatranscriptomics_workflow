#!/bin/bash
#PBS -N assembly
#PBS -o 98_log_files/assembly.prep.out
#PBS -l walltime=20:00:00
#PBS -l mem=50g
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR


TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
SCRIPT=$0
NAME=$(basename $0)
LOG_FOLDER="98_log_files"
cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

#Global variables
TRANSCRIPTOME="09_assembly_stats/trinity.raw.fa"
#########################################################################
#Required

trans="--transcripts $TRANSCRIPTOME"           		#transcript fasta file

meth="--est_method RSEM"         			#abundance estimation method.
                                        		#alignment_based:  RSEM|eXpress       
                                        		#alignment_free: kallisto|salmon
output="--output_dir 09_assembly_stats"            	#write all files to output directory

#  if alignment_based est_method:
alnmeth="--aln_method bowtie2"           			#bowtie|bowtie2|(path to bam file) alignment method.  (note: RSEM requires bowtie)
                                       			#(if you already have a bam file, you can use it here instead of rerunning bowtie)
                                         		#(note, no strand-specific mode for kallisto)
trinmode="--trinity_mode" 	  	                #Setting --trinity_mode will automatically generate the gene_trans_map and use it.

prepref="--prep_reference"

#run reference preparation
align_and_estimate_abundance.pl $trans $meth $alnmeth $trinmode $prepref $output 2>&1 | tee 98_log_files/"$TIMESTAMP"_prepref.log



