#!/bin/bash
#PBS -N matrix
#PBS -o 98_log_files/matrix.out
#PBS -l walltime=20:00:00
#PBS -l mem=5g
#####PBS -m ea 
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR

for i in $(ls -d 07_de_results/HI*) 
do 
base="$(basename $i)"

cp 07_de_results/"$base"/RSEM.isoforms.results 07_de_results/isoform."$base"

done

#Global variables
DATAIN="/01_projects/capamax/metatranscriptomics_workflow/07_de_results"		#path to abundance estimate files directory (isoforms.results files)

sample1="$DATAIN"/isoform.HI.4819.003.NEBNext_Index_12.29
sample2="$DATAIN"/isoform.HI.4819.003.NEBNext_Index_1.51
sample3="$DATAIN"/isoform.HI.4819.003.NEBNext_Index_2.1
sample4="$DATAIN"/isoform.HI.4819.003.NEBNext_Index_4.21
sample5="$DATAIN"/isoform.HI.4819.004.NEBNext_Index_2.26
sample6="$DATAIN"/isoform.HI.4819.004.NEBNext_Index_6.48
sample7="$DATAIN"/isoform.HI.4819.005.NEBNext_Index_16.11
sample8="$DATAIN"/isoform.HI.4819.005.NEBNext_Index_19.41
sample9="$DATAIN"/isoform.HI.4819.005.NEBNext_Index_5.31
sample10="$DATAIN"/isoform.HI.4819.006.NEBNext_Index_20.16
sample11="$DATAIN"/isoform.HI.4819.006.NEBNext_Index_2.55

abundance_estimates_to_matrix.pl --est_method RSEM --gene_trans_map none $sample1 $sample2 $sample3 $sample4 $sample5 $sample6 $sample7 $sample8 $sample9 $sample10 $sample11

