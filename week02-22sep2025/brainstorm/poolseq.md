## Exercise B
**Group member GitHub usernames**: CeliaPolanco, chiarakehl, chuddy-ibk

**Technology**: Pool-seq

**Description**: Pool-seq (pooled sequencing) is a genomic approach where DNA from many individuals within a population is combined into a single sample and sequenced together, rather than sequencing each individual separately. This method provides estimates of allele frequencies across the population at a much lower cost and effort compared to individual sequencing. While it does not preserve information about individual genotypes, Pool-seq is powerful for studying population genetics, such as detecting selection, estimating genetic diversity, or identifying population structure.

**Source**: ChatGPT, "write a short paragraph of how pool-seq works"

**Application**: Pool-seq's diverse applications include estimating allele frequencies across populations, tracking evolutionary changes over time, detecting signatures of natural selection, assessing genetic diversity and population structure, monitoring low-frequency or rare variants, and studying structural variants such as transposable element insertions or copy-number changes. In Kofler et al. (2012), Pool-seq was used to study transposable element dynamics in a natural population of Drosophila melanogaster, revealing a large number of both known and novel insertions and showing how their frequencies are influenced by selection, recombination, and TE family characteristics.

- Allele frequency spectrum (AFS): Looks at how common or rare different genetic variants are across the population.
- Nucleotide diversity (π) and heterozygosity: Measures how much genetic variation exists by checking how often DNA sequences differ at a site.
- Tajima’s D, F_ST, and similar statistics:
    - Tajima’s D: Checks whether variation looks “normal” or suggests selection/bottlenecks.
    - F_ST: How genetically different two populations are; higher = more distinct.
- Detecting selection: Identifies regions where selection may be acting.
- Temporal analysis: Tracks allele-frequency changes over time.

**Sources:** 

1. Personally modified output from ChatGPT, "Write a short paragraph explaining the different applications of pool-seq and include as an example the application of pool-seq of the paper: Robert Kofler, Andrea J. Betancourt, and Christian Schlötterer, “Sequencing of Pooled DNA Samples (Pool-Seq) Uncovers Complex Dynamics of Transposable Element Insertions in Drosophila Melanogaster,” PLoS Genet 8, no. 1 (January 26, 2012): e1002487, doi:10.1371/journal.pgen.1002487."

2. Robert Kofler, Andrea J. Betancourt, and Christian Schlötterer, “Sequencing of Pooled DNA Samples (Pool-Seq) Uncovers Complex Dynamics of Transposable Element Insertions in Drosophila Melanogaster,” PLoS Genet 8, no. 1 (January 26, 2012): e1002487, doi:10.1371/journal.pgen.1002487.
https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002487

**Statistical analysis:** Assuming the application: Temporal analysis of allele frequencies as a measure of divergence (to detect loci under selection). The goal is to identify loci that show unusually large allele frequency changes (Δ𝑝) over time, which may indicate divergent or directional selection. Since Pool-seq provides allele counts from pooled DNA, statistical methods must account for sampling noise, sequencing error, and the stochasticity of allele frequency changes due to drift.

1) Modelling Neutral Drift  
    To test whether allele frequency changes are due to selection, we first need to know what changes would look like if they were only caused by random chance (genetic drift). Models for this include:  
    - **Binomial model:** Think of allele counts like flipping a coin many times, choosing between reference allel and alternative allel. Frequencies change randomly.  
    - **Beta-binomial model:** Similar to the binomial, but adds extra “messiness” to account for sequencing errors or biases.  
    - **Wright-Fisher simulations:** Computer simulations of how allele frequencies would randomly change over generations, given population size and time.  

2) Statistical Testing for Divergent Selection  
    Once we know what random change looks like, we can ask whether the observed allele frequency changes are too big to be explained by drift alone. Common approaches are:  
    - **Approach 1: Outlier detection**  
        - Look for loci where allele frequency changes are much larger than expected.  
        - Loci with extreme changes (e.g., top 1% of the genome) are considered possible targets of selection.  
    - **Approach 2: Likelihood / Bayesian methods**  
        - Compare how likely the data are under two models: drift-only versus drift + selection.  
        - If the data fit the selection model much better, this suggests a nonzero selection coefficient (s).  
    - **Approach 3: Regression / GLMs**  
        - Treat allele frequency as a trend over time.  
        - If the trend is too strong to be explained by drift, the locus may be under selection.  

3) Multiple Testing Correction  
    Because we test thousands or even millions of loci, some will look like “false positives” just by chance.  
    - To avoid this, methods like **false discovery rate (FDR) correction** are used.  
    - Only loci that remain significant after correction are considered reliable candidates for selection.  

