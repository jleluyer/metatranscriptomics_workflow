#!/bin/bash
#PBS -N assembly
#PBS -o 98_log_files/rsem.__BASE__.out
#PBS -l walltime=20:00:00
#PBS -l mem=200g
#####PBS -m ea 
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR


TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
SCRIPT=$0
NAME=$(basename $0)
LOG_FOLDER="98_log_files"
cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

sample=__BASE__

#Global variables
TRANSCRIPTOME="09_assembly_stats/trinity.raw.fa"
READSLEFT="/scratch/home1/jleluyer/capamax/03_trimmed/"$sample"_R1.paired.fastq.gz"
READSRIGHT="/scratch/home1/jleluyer/capamax/03_trimmed/"$sample"_R2.paired.fastq.gz"

#########################################################################
#Required

trans="--transcripts $TRANSCRIPTOME"           		#transcript fasta file
seq="--seqType fq"	               			#fq|fa

#  If Paired-end:
left="--left $READSLEFT"
right="--right $READSRIGHT"

#  or Single-end:
#single="--single $READSSINGLE"
meth="--est_method RSEM"         			#abundance estimation method.
                                        		#alignment_based:  RSEM|eXpress       
                                        		#alignment_free: kallisto|salmon
output="--output_dir 07_de_results/"$sample""            	#write all files to output directory

#  if alignment_based est_method:
alnmeth="--aln_method bowtie2"           			#bowtie|bowtie2|(path to bam file) alignment method.  (note: RSEM requires bowtie)
                                       			#(if you already have a bam file, you can use it here instead of rerunning bowtie)
# Optional:
                                         		#(note, no strand-specific mode for kallisto)
cpu="--thread_count 8"                  		#number of threads to use (default = 4)
#genetrans="--gene_trans_map <string>"        		#file containing 'gene(tab)transcript' identifiers per line.
#     or  
trinmode="--trinity_mode" 	  	                #Setting --trinity_mode will automatically generate the gene_trans_map and use it.


#Align
align_and_estimate_abundance.pl $trans $seq $single $left $right $meth $output $trinmode $alnmeth $strand $cpu $maxins $coord $bowtie_rsem $bowtie2_rsem $include_rsem_bam $rsem_opt 


#note: Not all the commands have been integrated to data
