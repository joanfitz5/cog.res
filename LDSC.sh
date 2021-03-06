

# to examine generatic correlations between my diffenrent GWAS and exteral traits , I created munge files for each parameter to be examined -x.sumstats.gz 
# performed LDSC in genomicSEM.

library ('devtools')
library ('GenomicSEM')
traits <- c("res.sumstats.gz", "EY.sumstats.gz")
sample.prev <- c(NA,NA)
population.prev <- c(NA,NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names<-c("res", "EY")
LDSCoutput <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput, file = "EY.res.EY.ldsc.rdata")

 #example output
 cat ldsc.res.0207.out

[1] "Multivariate ld-score regression of 2 traits (res.sumstats.gz 0207z.sumstats.gz) began at: 2020-10-05 09:25:29"
[1] "Reading in LD scores"
[1] "Estimating heritability for: res.sumstats.gz"
[1] "Read in summary statistics from: res.sumstats.gz"
[1] "Read in summary statistics for 831113 SNPs"
[1] "827822 SNPs remaining after merging file with LD-score files"
[1] "Removed 0 SNPs with Chi^2 > 156.011"
[1] "827822 SNPs remain"
[1] "Heritability Results for trait: res.sumstats.gz"
[1] "Lambda GC: 1.2519"
[1] "Mean Chi^2 across remaining SNPs: 1.337"
[1] "Intercept: 0.926 (0.0096)"
[1] "Lambda GC: 1.2519"
[1] "Ratio: -0.2196 (0.0285)"
[1] "Total Observed Scale h2: 0.1265 (0.0064)"
[1] "h2 Z: 19.701083"
[1] "Calculating genetic covariance for traits: res.sumstats.gz and 0207z.sumstats.gz"
[1] "Read in summary statistics from 0207z.sumstats.gz"
[1] "Read in summary statistics for 1038879 SNPs"
[1] "After merging res.sumstats.gz and 0207z.sumstats.gz summary statistics for 831113 SNPs remain"
[1] "827822 SNPs remaining after merging the files with LD-score files"
[1] "Removed 0 SNPs with Chi^2 > 156.011 for res.sumstats.gz or SNPs with Chi^2 > 80 for 0207z.sumstats.gz (827822 SNPs remain)"
[1] "Results for genetic covariance between: res.sumstats.gz and 0207z.sumstats.gz"
[1] "Mean Z*Z: 0.0544"
[1] "Cross trait Intercept: 0.0084 (0.0058)"
[1] "Total Observed Scale Genetic Covariance (g_cov): 0.0294 (0.0087)"
[1] "g_cov Z: 3.3766593"
[1] "g_cov P-value: 0.00073372"
[1] "Estimating heritability for: 0207z.sumstats.gz"
[1] "Read in summary statistics from: 0207z.sumstats.gz"
[1] "Read in summary statistics for 1038879 SNPs"
[1] "1020589 SNPs remaining after merging file with LD-score files"
[1] "Removed 0 SNPs with Chi^2 > 80"
[1] "1020589 SNPs remain"
[1] "Heritability Results for trait: 0207z.sumstats.gz"
[1] "Lambda GC: 1.1396"
[1] "Mean Chi^2 across remaining SNPs: 1.169"
[1] "Intercept: 1.0077 (0.0087)"
[1] "Lambda GC: 1.1396"
[1] "Ratio: 0.0454 (0.0514)"
[1] "Total Observed Scale h2: 0.267 (0.0289)"
[1] "h2 Z: 9.2354753"
[1] "Genetic Correlation Results"
[1] "Genetic Correlation between res and 0207: 0.1597 (0.0473)"
[1] "LDSC finished running at 2020-10-05 09:26:41"
[1] "Running LDSC for all files took 1 minutes and 12.5871486663818 seconds"

# imaging data was downloaded at  https://open.win.ox.ac.uk/ukbiobank/big40/ which is a GWAS atlas of all imaging phenotypes. 
# note that these files are all in the direction of the A2 allele so the beta values need to be reversed
# note that the p values are -log10 and need to be convereted. 
