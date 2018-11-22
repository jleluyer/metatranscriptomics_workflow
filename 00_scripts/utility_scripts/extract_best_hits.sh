#!/bin/bash
#PBS -N besthits
#PBS -o 98_log_files/best.hits
#PBS -l walltime=50:00:00
#PBS -l mem=10g
#PBS -l ncpus=1
#PBS -r n

cd $PBS_O_WORKDIR


#for i in $(cat list_uniprot.txt); do grep "$i" blast_annotation_uniprot.txt|head -n 1 >>best.hits.uniprot.txt; done

awk -F "\t" '{print $6"\t"$1"\t"$2}' blast_annotation_Tm.txt|sed 's/ /_/g'|uniq -f 1|sed 's/ / /g' >best.hits.Tm.txt
#for i in $(awk -F "\t" '{print $1}' blast_annotation_nt.txt|sort -u); do grep "$i" blast_annotation_nt.txt|head -n 1 >>best.hits.nt.txt; done



awk -F "\t" '{print $6"\t"$1"\t"$2}' blast_annotation_Tm.txt|sed 's/ /_/g'|uniq -f 1|sed 's/ / /g' >best.hits.unprot.txt
