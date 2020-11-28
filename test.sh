# first use fastqc to check the quality of our fastq files:
fastqc *.gz -t 4

# next, we want to build an index from our reference fasta file 
# I get my reference mammalian transcriptome files from here: https://useast.ensembl.org/info/data/ftp/index.html
kallisto index -i Homo_sapiens.GRCh38.cdna.all.index Homo_sapiens.GRCh38.cdna.all.fa.gz
