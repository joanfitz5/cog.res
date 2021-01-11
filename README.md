Identification of 13 independent genetic loci associated with cognitive resilience in healthy ageing in 330,097 individuals in the UK Biobank .

Code used to create the GWAS-by-subtraction of Resilience , and for follow-up analyses.

1. Generation of initial GWAS of EY + Res and EY/NonRES and EY and RT for futher analysis (Generation_of_GWAS.sh)
2. Code for GWAS-by-Subtration (GWAS-by-subtraction.sh)
3. Calculation of sample size after GWAS-by-Subtration (Sample_size.sh)
4. Conditional analysis(Conditional_analysis.sh)
5. FINEMAP (FINEMAP.sh)
6. Drawing Venn diagram (Venn_diagram.sh)
7. Magma analysis(Magma.sh)
8. LD score regression analysis (LDSC.sh)
9. Generalised Summary statistics-based Mendelian Randomisation (GSMR.sh)

During the couse of this analysis the terms used for the inputs and outputs to GWAS-by-Subtraction changed as follows:
for RV read EY+Res and for V read EY/NonRes
for res read Resilience and for var read EduYears analysis
