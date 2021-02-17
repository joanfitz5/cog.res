# in order to examine the effect of the large locus on chromosome 3 on functional analysis it was removed from all.res.txt  
# I extracted the SNPs on chromosome 3  from locus 49385350 to 50250837 using awk and sort. 
 awk ‘$2 ==3’ all.res.txt > 3.txt 
 awk '$3 < 49385350' 3.txt >3.txt.low
 awk '$3 > 50250837' 3.txt >3.txt.high
 cat 3.txt.low 3.txt.high >new.3.txt
 
 awk '$2 != 3' all.res.txt > all.res.minus3
 cat all.res.minus3 new.3.txt >all.res.minus3.txt
 
 # gzip the file and export to FUMA
