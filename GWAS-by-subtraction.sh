# References:
# GenomicSEM: https://github.com/MichelNivard/GenomicSEM/wiki
# GWAS-by-subtraction: https://rpubs.com/MichelNivard/565885

# For GWAS by subtraction
# first creat munge files from GWAS outputs
library ('devtools')
library ('GenomicSEM')
munge("all.RV", "hm3.txt",trait.names=("RV"),N=156011)
# repeat for all GWAS ouputs RV and V (all, test and replication)

# output of munging for V

Interpreting the SNP column as the SNP column.
Interpreting the A1 column as the A1 column.
Interpreting the A2 column as the A2 column.
Interpreting the OR column as the effect column.
Interpreting the P column as the P column.
Interpreting the MAF column as the MAF (minor allele frequency) column.
Merging file: V.all with the reference file: hm3.txt
8997585 rows present in the full V.all summary statistics file.
8148252 rows were removed from the V.all summary statistics file as the rs-ids for these rows were not present in the reference file.
The effect column was determined to be coded as an odds ratio (OR) for the V.all summary statistics file. Please ensure this is correct.
184 row(s) were removed from the V.all summary statistics file due to the effect allele (A1) column not matching A1 or A2 in the reference file.
96 row(s) were removed from the V.all summary statistics file due to the other allele (A2) column not matching A1 or A2 in the reference file.
No INFO column, cannot filter on INFO, which may influence results
17689 rows were removed from the V.all summary statistics file due to missing MAF information or MAFs below the designated threshold of 0.01
831364 SNPs are left in the summary statistics file V.all after QC.
I am done munging file: V.all
The file is saved as V.sumstats.gz in the current working directory.

# To run GBS with our server it is necessary to do it one chromosome at a time  to avoid incomplete analysis -to do this it is necessary to split the sumstats in separated chromosomes. This was done as follows:

for i in {1..22}; do grep "^${i} " /data/joanf/sem/V.all > V.${i}.sumstats; done

# To insert headers i did

sed -i '1s/^/CHR POS SNP A2 A1 OR SE P\n/' V.*.sumstats


./Rscript gbs.newall.txt RV.${SLURM_ARRAY_TASK_ID}.sumstats V.${SLURM_ARRAY_TASK_ID}.sumstats ${SLURM_ARRAY_TASK_ID}
 
cat gbs.newall.txt
library ('devtools')
library ('GenomicSEM')
args = commandArgs(trailingOnly=TRUE)

files = c(args[1],args[2])

ref = "UKB.reference"
trait.names = c("RV","V")
se.logit = c(F,F)
info.filter = 0.9
maf.filter = 0.001

p_sumstats<-sumstats(files, ref, trait.names, se.logit, info.filter, maf.filter, OLS=c(T,T),linprob=NULL, prop=NULL, N=c(156011,174086),cores=16)
#save(p_sumstats, file="Sumstatsres.RData")

traits <- c("RV.sumstats.gz", "V.sumstats.gz")
sample.prev <- c(.50,.50)
population.prev <- c(NA,NA)
ld<-"eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names<-c("R", "V")

LDSCoutput <- ldsc(traits,
                   sample.prev,
                   population.prev,
                   ld,
                   wld,
                   trait.names)
#save(LDSCoutput, file="LDSCoutputres.RData")
model<-'var=~NA*RV +start(0.2)*RV +start(0.5)*V
res=~NA*RV +start(0.2)*RV

var~SNP
res~SNP

res~~1*res
var~~1*var
var~~0*res

V ~~ 0*RV
V~~0*V
RV~~0*RV
SNP~~SNP'

#Run the Genomic SEM GWAS
outputGWAS<-userGWAS(covstruc=LDSCoutput,SNPs=p_sumstats,estimation="DWLS",model=model,sub =c("var~SNP","res~SNP"),cores=16, printwarn = FALSE)
save(outputGWAS, file=paste("alla.",args[3],".RData",sep=""))
write.table(outputGWAS, file=paste("all.",args[3],".out",sep=""), row.names=F,quote=F)

# output was 22 files for all, test and replic - all.1.txt to all.22.txt. These were joined using cat as follows:

cat all.* >all.txt
# The files were then sorted using awk and print into all.res.txt and all.var.txt for further analysis

# for RV read EY+Res and for V read EY/NonRes
# for res read Resilience and for var read EduYears
# analysis repeated for all, test and replic GWAS 
