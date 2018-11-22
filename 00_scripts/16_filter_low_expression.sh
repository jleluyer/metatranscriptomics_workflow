#!/bin/bash
#PBS -N filter
#PBS -o 98_log_files/filtermatrix.out
#PBS -l walltime=20:00:00
#PBS -l mem=5g
#####PBS -m ea 
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR

#Global variables
ASSEMBLY="09_assembly_stats/trinity.raw.fa"
MATRIX="07_de_results/RSEM.isoform.TPM.not_cross_norm"			#path to abundance matrix (matrix.TPM.not_cross_norm file)

#Trinity variables
OUTPUT="09_assembly_stats/trinity.nolow.expression.fa"


#Global variables
MIN_EXPR=1
DATAIN="/01_projects/capamax/metatranscriptomics_workflow/07_de_results"

filter_low_expr_transcripts.pl --transcripts $ASSEMBLY --matrix $MATRIX --highest_iso_only --min_expr_any $MIN_EXPR --trinity_mode > $OUTPUT


TrinityStats.pl $OUTPUT >09_assembly_stats/filter_low.1.expression.stats
