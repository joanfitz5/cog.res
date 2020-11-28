# Reference : https://cnsgenomics.com/software/gcta/#Overview 

# I used the GSMR function in GCTA - not the R version

# Need to creat an exposure and outcome file.

# exposure file - gsmr_exposure.all.txt
  res gsmr.res
  head gsmr.res  
snp A1 A2 freq b se p N
rs2352974 T C 0.491515 0.0796596119968793 0.0102802118169184 9.27432030361552e-15 114313
rs2230590 T C 0.483655 -0.0793709144179695 0.0102863859846926 1.1993119402491e-14 114313

# outcome file - gsmr.outcomeSCZ.txt  
  SCZ SCZ.glA.txt


>./gcta64 --bfile cogres --gsmr-file gsmr_exposure.all.txt gsmr.outcomeSCZ.txt --gsmr-direction 2 --heidi-thresh 0.01 --out res.SCZ.gsmr_result

# need independent data sets so for imaging I used the test ( discovery) GWAS for Resilience as this did not contain any participants used for imaging

# as the number of loci was low in the test GWAS I changed the default paramaeter for minimum loci from 10 to 8 --gsmr-snp-min 8

>./gcta64 --bfile cogres --gsmr-file gsmr_exposure.all.txt gsmr.outcome0207.txt --gsmr-direction 2 --gsmr-snp-min 8 --heidi-thresh 0.01 --out res.0207.gsmr_result
