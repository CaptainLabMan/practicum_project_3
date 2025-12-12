# 1
fastqc -o ./reads/fastqc reads/SRR292678sub_S1_L001_R1_001.fastq.gz reads/SRR292678sub_S1_L001_R2_001.fastq.gz  

reads_count:  
> SRR292678sub_S1_L001_R1_001.fastq.gz - 5499346  
> SRR292678sub_S1_L001_R2_001.fastq.gz - 5499346

# 2 (OPTIONAL)

# 3 
Assembled genome was downloaded in [refs](refs/SRR292678.zip) folder and unzipped manually with followed command:
```bash
unzip SRR292678.zip
```  

```bash
quast.py refs/SRR292678/contigs.fasta refs/SRR292678/scaffolds.fasta -t 1 -o quast/short_reads > quast/short_reads/quast.stdout.log 2> quast/short_reads/quast.stderr.log 
```  

# 4 
Long reads was donloads in [refs](refs/SRR292678.zip) folder:  

```bash
quast.py refs/SRR292678/contigs.fasta refs/SRR292678/scaffolds.fasta refs/scaffolds.fasta -t 1 -o quast/long_reads > quast/long_reads/quast.stdout.log 2> quast/long_reads/quast.stderr.log   
```  

QUAST report:  
![quast_output](images/quast_output.png)  
> *contigs: short conting*  
> **SRR292678_scaffolds: short scaffolds*  
> *refs_scaffolds: long scaffolds*  