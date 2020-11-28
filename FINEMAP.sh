# go to Benner http://www.christianbenner.com for method


#Step 1 create a LD and z files for each locus
#6f.z was created from list of candidated GWAS SNPs in FUMA pertaining to chr 6. 
#Essential to sort by position - if not I got inconsistent results

(base) [joanf@lugh finemap_v1.4_x86_64]$ head 6f.z
rsid chromosome position allele1 allele2 maf beta se
rs675974 6 98237598 T C 0.473141 0.0509698268400689 0.0101398972404397
rs12208753 6 98248413 G A 0.477258 0.0517681156485316 0.0101458846065994
rs9374896 6 98310484 T C 0.465235 -0.0525038804532472 0.0102174052634843
rs9374897 6 98310571 A G 0.465198 -0.0523883630773792 0.0102166230419012
rs9489945 6 98311875 C G 0.40354 0.0566028174329238 0.0103549177706525
rs1338549 6 98312143 T G 0.465493 -0.0526368254145968 0.0102187821322734

# from this file (6f.z) creat a SNP list (6.fuma) and process as follows

./plink --bfile cogres --chr 6 --extract 6.fuma --r square spaces --out 6f

#note: LD files were created using plink 1.9 as the Benner method uses bgen files

 head 6f.ld
1 0.975446 0.975434 0.975432 0.975683 0.97514 0.975277 0.974735 0.974921 -0.595757 -0.59498 -0.595002 0.819089 -0.590268 0.813273 0.811148 -0.588014 0.808856 -0.586099 0.808361 -0.587434 0.809254 0.808982 -0.586902 0.80906 -0.598064 -0.586866 -0.586866 -0.586866 -0.586891 -0.586891 0.809017 0.809083 -0.586893 -0.586917 0.809117 0.80918 -0.587138 -0.586899 0.808943 -0.586858 -0.586858 -0.586638 -0.586611 -0.586593 -0.58659 -0.586595 -0.586597 -0.586598 -0.586443 -0.586546 -0.586549 -0.586491 0.64052 0.808622 0.808596 0.655013 -0.640605 -0.62392 0.638064 -0.623948 -0.623923 -0.623927 -0.62402 -0.622142 0.638811 0.635769 -0.621649 -0.62168 -0.621692 0.635682 -0.621684 -0.621681 -0.621558 0.635288 0.635497 -0.621569 -0.621584 -0.621438 0.635499 0.635312 -0.621472 -0.621355 0.649041 0.647392 0.647964 0.647242 0.647556 0.647244 0.646835 0.645148 0.645763 0.6456 0.645717 0.644176 0.638056 0.640308 0.642537 0.642557 0.63925 0.639257 0.639219 0.628522
0.975446 1 0.999997 0.999988 0.999687 0.999706 0.999848 0.99925 0.999439 -0.617967 -0.618994 -0.619017 0.854545 -0.617851 0.852702 0.852193 -0.616952 0.850747 -0.616615 0.850289 -0.617475 0.851235 0.851038 -0.617554 0.851112 -0.628602 -0.617519 -0.617519 -0.617519 -0.617544 -0.617544 0.851069 0.851146 -0.617546 -0.617567 0.851184 0.851231 -0.617356 -0.617559 0.850996 -0.617504 -0.617505 -0.617299 -0.617268 -0.617249 -0.617246 -0.617251 -0.617253 -0.617253 -0.617109 -0.617205 -0.617198 -0.616301 0.685554 0.850473 0.85043 0.689509 -0.67412 -0.656819 0.671894 -0.656854 -0.656815 -0.656852 -0.656933 -0.655097 0.672643 0.669522 -0.654501 -0.654529 -0.654546 0.66945 -0.654544 -0.654535 -0.654398 0.669076 0.669255 -0.654403 -0.654431 -0.654289 0.669259 0.669062 -0.65432 -0.654186 0.686705 0.685024 0.685598 0.684855 0.685407 0.684877 0.684436 0.68273 0.683319 0.683134 0.683299 0.681733 0.675593 0.677841 0.680003 0.680027 0.677034 0.677045 0.677002 0.665706

# Step 2: using these files create a master file as follows:

cat master6f\
z;ld;snp;config;cred;n_samples
6f.z;6f.ld;6f.snp;6f.config;6f.cred;111316

# first two files are input files 6f.z and 6f.ld. Other files are output files

# Step 3: perform fine mapping

./finemap_v1.4_x86_64 --sss --n-causal-snps 3 --in-files master6f ( to specify only 3 snps)

# repeat for all 13 loci

