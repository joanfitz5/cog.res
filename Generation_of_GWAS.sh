#code for generation of EY/NonRes GWAS in plink 2.0
 --bfile cogres
  --covar impute.age.cov
  --covar-variance-standardize
  --glm hide-covar cols=+a1freq
  --out all.nores.ey
  --pheno norm.pheno.txt
#Code for genertation of Res+EY GWAS in plink 2.0
--bfile cogres
  --covar impute.age.cov
  --covar-variance-standardize
  --glm hide-covar cols=+a1freq
  --out all.res.ey
  --pheno res.pheno.txt

# bfile cogres is UK biobank sample after QC, Covar file is age, sex, test centre, genotype array and first 8 PCA supplied by UK biobank, 
# pheno file is generated from the res and norm groups as described in phenotype file.

# Code for generation of test and relication samples as above just changed the pheno files to test and replic for res and norm.
# Generation of EY50 GWAS
--bfile cogres
  --covar impute.age.cov
  --covar-variance-standardize
  --glm hide-covar cols=+a1freq
  --out EY50.shuf
  --pheno EY50.shuf1.txt

# To compare EY GWAS and RT GWAS with EY+Res and EY/NonRes I needed a pheno file of the same size 
# To prepare EY GWAS creat high low EY pheno file and reduce by 50 % uisng awk, shuf (to ensure random selection) and head -82000.
# All GWAS outputs were trimmed for further analysis to SNP CHR POS MAF A2 A1 Beta SE stat P

EY/NonRes -> all.var.txt
EY+Res -> all.res.txt
test.EY/NonRes -> test.var.txt
test.Res+EY -> test.res.txt
replic.EY/NonRes->replic.var.txt
replic.EY+Res-> replic.res.txt


