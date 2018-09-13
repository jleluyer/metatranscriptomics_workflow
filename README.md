# metatranscriptomics_workflow

Pipeline for analyses of bacterial metatranscriptomics data

WARNING

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

### Step-by-step documentation

```
00_scripts/datarmor_jobs/01_trimmomatic_jobs_pe.sh
```

```
qsub 00_scripts/02_index_rnadb.sh
```

```
00_scripts/datarmor_jobs/03_merge_pe_reads_jobs.sh
```

```
00_scripts/datarmor_jobs/04_filtering_rna_jobs.sh
```

```
00_scripts/datarmor_jobs/05_unmerge_non_rna_jobs.sh
```

```
00_scripts/datarmor_jobs/06_fastq_join_jobs.sh
```

```
00_scripts/datarmor_jobs/07_fraggenescan_jobs.sh
```


## Notes

## Dependencies

[Fastq-join](https://bioconda.github.io/recipes/fastq-join/README.html)

[FragGenScan](http://omics.informatics.indiana.edu/FragGeneScan/)

[SortMeRna](http://bioinfo.lifl.fr/RNA/sortmerna/)

[Trimmomatic](http://www.usadellab.org/cms/index.php?page=trimmomatic)

## Dependences

This pipeline is adapted from [Metatrans](http://www.metatrans.org/) pipeline 
