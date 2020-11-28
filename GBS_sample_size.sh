# Reference: 
# GWAS-by-subtraction: https://rpubs.com/MichelNivard/565885
# GBS N effective calculation: https://github.com/PerlineDemange/non-cognitive/blob/master/GenomicSEM/Cholesky%20model/Calculation_samplesize


# to calculate sample size I needed to find the model loadings. To do this I need to exclude the SNP effects from the model. 

library ('devtools')
library ('GenomicSEM')
traits <- c("RV.sumstats.gz", "V.sumstats.gz")
sample.prev <- c(.50,.50)
population.prev <- NA
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names<-c("RV", "V")
LDSCoutput <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)

model<-'var=~NA*RV+start(0.4)*V

res=~NA*RV


res~~1*res
var~~1*var
var~~0*res

V ~~ 0*RV
V~~0*V
RV~~0*RV'

output<-usermodel(LDSCoutput,estimation="DWLS",model=model)
saveRDS(output, file="model" )


# example output 
> readRDS(file = "model")
$modelfit
   chisq df p_chisq AIC CFI SRMR
df    NA  0      NA  NA  NA   NA

$results
  lhs op rhs Unstand_Est          Unstand_SE STD_Genotype    STD_Genotype_SE
1 res =~  RV   0.4220185 0.00952836622225814    0.8370796 0.0188996458641997
2 res ~~ res   1.0000000                        1.0000000
3 var =~  RV   0.2758141  0.0111413095150852    0.5470812 0.0220989414310092
4 var =~   V   0.5081284 0.00915739568458178    1.0000000   0.01802181420232
5 var ~~ var   1.0000000                        1.0000000
    STD_All               p_value
1 0.8370796              < 5e-300
2 1.0000000                  <NA>
3 0.5470812 2.67241462357037e-135
4 1.0000000              < 5e-300
5 1.0000000                  <NA>

# the model loadings vary depending on sample size so it is necessary to calculate it for all, test and replication ( Full, Exploration & Replication)
# To determine effective N it is nessaary to trim my input data in linux using awk to only include SNPs with maf > 0.1 and < 0.4.
# Full sample resilience was saved as N2.all.res.txt
# I processed the Neffective calculation in R as follows:
 > library (data.table)
data.table 1.12.8 using 8 threads (see ?getDTthreads).  Latest news: r-datatable.com
> res <- fread("N2.all.res.txt", stringsAsFactors = F, data.table=F)
> res$Neff <- ((res$Z/(res$est*0.422))^2)/(2*res$MAF*(1-res$MAF))
> summary(res$Neff)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
 105876  111260  111396  111316  111467  111513
> head (res)
         SNP CHR        BP      MAF A2 A1         est         SE Z_Estimate
1  rs2189234   4 106075498 0.383441  G  T  0.07315071 0.01049333   6.971161
2 rs13123752   4 106082120 0.383738  A  G  0.07300530 0.01049106   6.958808
3 rs10461139   4 106105299 0.363847  G  A  0.06890590 0.01057916   6.513362
4 rs62074125  17  44852612 0.252886  A  C -0.07668285 0.01180675  -6.494831
5  rs6818637   4 106097339 0.364024  C  T  0.06859859 0.01057678   6.485775
6  rs6533181   4 106074826 0.369225  G  T  0.06834838 0.01054468   6.481791
  Pval_Estimate     Neff
1  3.143369e-12 107856.2
2  3.431633e-12 107871.3
3  7.348709e-11 108383.3
4  8.312673e-11 106603.8
5  8.827668e-11 108409.6
6  9.064029e-11 108420.9

# repeat for all 6 GBS outputs running the model for each sample saize and adjusting the x$Neff equation appropriately. 




