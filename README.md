# 1
fastqc -o ./reads/fastqc reads/SRR292678sub_S1_L001_R1_001.fastq.gz reads/SRR292678sub_S1_L001_R2_001.fastq.gz  

reads_count:  
> SRR292678sub_S1_L001_R1_001.fastq.gz - 5499346  
> SRR292678sub_S1_L001_R2_001.fastq.gz - 5499346

# 2 (OPTIONAL)

# 3 
Assembled genome was downloaded in **refs** folder and unzipped manually with followed command:
```bash
unzip SRR292678.zip
```  

```bash
quast.py refs/SRR292678/contigs.fasta refs/SRR292678/scaffolds.fasta -t 1 -o quast/short_reads > quast/short_reads/quast.stdout.log 2> quast/short_reads/quast.stderr.log 
```  

# 4 
Long reads were downloaded in **refs** folder:  

```bash
quast.py refs/SRR292678/contigs.fasta refs/SRR292678/scaffolds.fasta refs/scaffolds.fasta -t 1 -o quast/long_reads > quast/long_reads/quast.stdout.log 2> quast/long_reads/quast.stderr.log   
```  

QUAST report:  
![quast_output](images/quast_output.png)  
> *contigs: short conting*  
> *SRR292678_scaffolds: short scaffolds*  
> *refs_scaffolds: long scaffolds*  

# 5
```bash
prokka --outdir prokka --force --centre XXX refs/scaffolds.fasta
```

# 6 
```bash
barrnap refs/scaffolds.fasta --kingdom bac --threads 6 > barrnap/barrnap_my_bac.gff 2> barrnap/barrnap_my_bac.stderr.log  

awk 'NR==1 || $9 ~ /^Name=16S_rRNA/' barrnap/barrnap_my_bac.gff > barrnap/barrnap_my_bac.16s_rrna.gff

awk '!/^#/ {print $1 "\t" $4-1 "\t" $5 "\t" $9}' barrnap/barrnap_my_bac.16s_rrna.gff > barrnap/barrnap_my_bac.16s_rrna.bed

bedtools getfasta -fi refs/scaffolds.fasta -bed barrnap/barrnap_my_bac.16s_rrna.bed > barrnap/barrnap_my_bac.16s_rrna.fa
```

Всего было выявлено 8 регионов соответствующих 16S rRNA.  
Один из этих регионов был выравнен только на 25% от 16S rRNA.  
Четыре региона на + цепи, 4 на -.  
Все 8 регинонов имеют разные хромосомные координаты и, скорее всего, являются уникальными (транскрибируются в разных направлениях), а не просто reverse-complement последовательностями.  

BLAST results:  
![blast_results](images/blast_results.png)  
> *Name (DEFINITION): **Escherichia coli 55989, complete sequence.***  
> *Annotation Name: **GCF_000026245.1-RS_2025_06_09***  
> *ACCESSION: **NC_011748***  

# 7 
Mauve was downloaded from the [source](https://darlinglab.org/mauve/download.html).  
![shiga_genes](images/shiga_genes.png)  
В исследуемом нами штамме E. coli X было выявлено 2 гена (а точнее 2 субъединицы), кодирующие шига-токсины:  
1. stxA (4445290-4446249)  
2. stxB (4446261-4446530)

# 8 
Да, у меня в файле много "hypothetical proteins", но основыяваясь на наличии, рядом расположенного, гена nohA_3 (Prophage DNA-packing protein NohA) можно предположить, что гены stxA и stxB были получены путем горизонтального переноса - лигозении (интеграции генома бактериофага в геном бактерии).  
> nohA_3 (4448169-4448717)

# 9 
**E. coli X AR:**  
![X_AR](images/x_ar.png)  

**55989 AR:**  
![55989_AR](images/55989_ar.png)  

# 10
![bla](images/bla.png)  
