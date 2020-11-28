# Reference: https://ctg.cncr.nl/software/magma

# I use MAGMA to perfrom conditional analysis on gene sets for gene onthology terms for biological pathways
# I used the raw gene file and the set data supplied in the FUMA output as inputs for the MAGMA analysis

Welcome to MAGMA v1.08 (linux)
Using flags:
        --gene-results magma.genes.raw
        --set-annot res.sets.file col=2,1
        --model condition=_SET1_
        --out magma.SET1.cond

Start time is 12:24:54, Friday 30 Oct 2020

Reading file magma.genes.raw...
        18879 genes read from file
Loading gene-set annotation...
Reading file res.sets.file...
        detected 2 variables in file
        using variable: variable 2 (gene ID)
        using variable: variable 1 (set ID)
        2 gene-set definitions read from file
        found 2 gene sets containing genes defined in genotype data (containing a total of 1913 unique genes)
Preparing variables for analysis...
        truncating Z-scores 3 points below zero or 6 standard deviations above the mean
        truncating covariate values more than 5 standard deviations from the mean
        total variables available for analysis: 2 gene sets

Parsing model specifications...
Inverting gene-gene correlation matrix...
Performing regression analysis...
        testing direction: one-sided, positive (sets), two-sided (covar)
        conditioning on internal variables:
                gene size, log(gene size)
                gene density, log(gene density)
                inverse mac, log(inverse mac)
        conditioning on input variables:
                _SET1_ (set)
        analysing individual variables

        analysing single-variable models (number of models: 1)
        writing results to file magma.SET1.cond.gsa.out
        writing gene information to file magma.SET1.cond.gsa.genes.out
        writing gene analysis results per significant result (after multiple testing correction, at alpha = 0.05) to file magma.SET1.cond.gsa.sets.genes.out

End time is 12:25:14, Friday 30 Oct 2020 (elapsed: 00:00:20)
Welcome to MAGMA v1.08 (linux)
Using flags:
        --gene-results magma.genes.raw
        --set-annot res.sets.file col=2,1
        --model condition=_SET2_
        --out magma.SET2.cond

Start time is 12:23:05, Friday 30 Oct 2020

Reading file magma.genes.raw...
        18879 genes read from file
Loading gene-set annotation...
Reading file res.sets.file...
        detected 2 variables in file
        using variable: variable 2 (gene ID)
        using variable: variable 1 (set ID)
        2 gene-set definitions read from file
        found 2 gene sets containing genes defined in genotype data (containing a total of 1913 unique genes)
Preparing variables for analysis...
        truncating Z-scores 3 points below zero or 6 standard deviations above the mean
        truncating covariate values more than 5 standard deviations from the mean
        total variables available for analysis: 2 gene sets

Parsing model specifications...
Inverting gene-gene correlation matrix...
Performing regression analysis...
        testing direction: one-sided, positive (sets), two-sided (covar)
        conditioning on internal variables:
                gene size, log(gene size)
                gene density, log(gene density)
                inverse mac, log(inverse mac)
        conditioning on input variables:
                _SET2_ (set)
        analysing individual variables

        analysing single-variable models (number of models: 1)
        writing results to file magma.SET2.cond.gsa.out
        writing gene information to file magma.SET2.cond.gsa.genes.out
        writing gene analysis results per significant result (after multiple testing correction, at alpha = 0.05) to file magma.SET2.cond.gsa.sets.genes.out

End time is 12:23:25, Friday 30 Oct 2020 (elapsed: 00:00:20)

