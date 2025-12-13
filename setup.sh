mkdir -p refs
mkdir -p reads/fastqc
mkdir -p alignments
mkdir -p quast
mkdir -p quast/short_reads
mkdir -p quast/long_reads
mkdir -p images
mkdir -p prokka
mkdir -p barrnap
mkdir -p blast
mkdir -p mauve
wget -P reads https://d28rh4a8wq0iu5.cloudfront.net/bioinfo/SRR292678sub_S1_L001_R1_001.fastq.gz
wget -P reads https://d28rh4a8wq0iu5.cloudfront.net/bioinfo/SRR292678sub_S1_L001_R2_001.fastq.gz