# metatranscriptomics_workflow

Pipeline for analyses of dual-RNAseq metatranscriptomics data

WARNING

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

## Step-by-step documentation

### Trimming
```
00_scripts/datarmor_jobs/01_trimmomatic_jobs_pe.sh
```

### Meta-transcriptome assembly (microbiome compartment)
```
qsub 00_scripts/02_trinity_assembly.sh
```

### Assembly statistics
```
qsub 00_scripts/03_assembly_stats.sh
```

### Meta-transcriptome filtering

```
qsub 00_scripts/04_longest_isoform.sh
```

```
qsub 00_scripts/datarmor_jobs/05_prepare_reference.sh
```

```
qsub 00_scripts/06_transcripts_abundance.sh
```

```
qsub 00_scripts/07_blastn_conta_host.sh
```

```
qsub 00_scripts/08_combine_matrix.sh
```

```
qsub 00_scripts/10_bis_filter_rna.sh
```

```
qsub 00_scripts/11_fraggenescan.sh
```

### Mapping

```
qsub 00_scripts/12_gmap_index.sh
```

```
00_scripts/datarmor_jobs/13_gsnap_mapping.sh
```

### Counting

```
00_scripts/datarmor_jobs/14_htseq_count.sh
```

### Annotation

## Dependencies

[Blast](https://www.ncbi.nlm.nih.gov/books/NBK279680/)

[Fastq-join](https://bioconda.github.io/recipes/fastq-join/README.html)

[FragGeneScan](http://omics.informatics.indiana.edu/FragGeneScan/)

[SortMeRna](http://bioinfo.lifl.fr/RNA/sortmerna/)

[Trimmomatic](http://www.usadellab.org/cms/index.php?page=trimmomatic)

[Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki)

## Notes

This pipeline is adapted from [Metatrans](http://www.metatrans.org/).

## Authors

Jérémy Le Luyer: jeremy.le.luyer@ifremer.fr

Quentin Schull: quentin.schull@ifremer.fr

Denis Saulnier: denis.saulnier@ifremer.fr

