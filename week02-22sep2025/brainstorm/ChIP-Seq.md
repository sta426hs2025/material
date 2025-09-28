Group Members:
1) leah086
2) teodorako
3) natalijamojsilovic


## ChIP-Seq Summary
***Chromatin Immunoprecipitation*** followed by sequencing is an assay used to map protein–DNA interactions across the genome. 
### Technology: 
The method combines chromatin immunoprecipitation with high-throughput sequencing which captures DNA fragments bound by transcription factors or modified histones.
### Application: 
This enables genome-wide mapping of protein–DNA interactions, identification of regulatory elements (promoters, enhancers), and comparison of binding landscapes between conditions (e.g., healthy vs. diseased tissue).
### Statistics: 
Computational analysis uses statistical models to distinguish true binding sites from background noise (Poisson/negative binomial models for peak calling, FDR correction for multiple testing, and GLMs for differential binding).

***What it does***:
Identifies where proteins bind to DNA.
Reveals the distribution of histone modifications that shape chromatin states.
***What it is used for***:
Studying gene regulation by mapping transcription factor binding sites.
Defining epigenetic landscapes, such as active promoters, enhancers, or repressed regions.
Comparing binding patterns between conditions (e.g., normal vs. disease).
Linking chromatin changes to development, cancer, and drug response

---

## How ChIP-seq Works: A Step-by-Step Workflow

The core principle is to cross-link proteins to DNA in vivo, immunoprecipitate the protein-of-interest along with its bound DNA fragments using a specific antibody, and then sequence those DNA fragments to pinpoint their genomic locations.

The ChIP-seq procedure can be broken down into several key steps, as illustrated in Fig.1. 
<div style="text-align: center;">
  <p><strong>Figure 1. ChIP-Seq wet-lab workflow overview.</strong></p>
</div>

![Fig.1 ChIP-Seq wet-lab workflow](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fnmeth.f.247/MediaObjects/41592_2009_Article_BFnmethf247_Fig1_HTML.jpg?as=webp)
				

1) ***Cross-linking***: Proteins are covalently fixed to DNA to preserve binding interactions.


2) ***Chromatin isolation and shearing***: The DNA–protein complexes are extracted and fragmented into smaller pieces.


3) ***Immunoprecipitation***: A protein-specific antibody selectively pulls down DNA fragments bound by the protein of interest.


4) ***Cross-link reversal and protein digestion***: The DNA is released by reversing the cross-links and removing proteins.


5) ***Library preparation***: Sequencing adaptors are ligated to DNA fragments, creating a library for high-throughput sequencing.

6) ***High-throughput sequencing***: The DNA library is sequenced (typically on Illumina platforms), producing millions of short reads that correspond to the fragments originally bound by the protein of interest. 

7) ***Read Alignment***
Sequencing reads are aligned to a reference genome using algorithms such as Bowtie2 or BWA.

8) ***Peak Calling***
Regions with statistically significant read enrichment (peaks) are identified using tools like MACS2, representing protein binding sites or histone modification marks.

## Downstream analysis

***Motif discovery***: Identifying enriched DNA motifs in transcription factor peaks.The aim is to detect regions where read density is statistically significantly enriched compared to random expectation (examples of statistical tests used - **Binomial test** and **Fisher’s exact test**).

***Functional annotation***: Linking peaks to nearby genes or regulatory elements. Statistical methods used in this section of the pipeline could for example be - **Hypergeometric test / Fisher’s exact test** (for dispersion analysis) and **Gene Set Enrichment Analysis (GSEA)** (for ranked gene lists). 

***Differential analysis***: Comparing binding between conditions (e.g., treated vs. control, WT vs. KO). The statistical models used could be for example - **Generalized Linear Models (GLMs)** with **Negative Binomial** error distribution.

---

 ## More on Statistical Methods - Computational Analysis in ChIP-Seq  

- **Data type:** Count data (number of reads mapped to genomic regions)
- **Peak calling:** Sliding windows across the genome count reads in ChIP vs control samples.
- **Probabilistic models:** Determine if counts are unexpectedly high.

#### Methods:

- **Negative Binomial (NB) models**:  
  - Handle overdispersion better than Poisson.  
  - Used in tools like `DESeq2`, `edgeR`, `DiffBind`.  
  - NB introduces a **dispersion parameter** to account for variance beyond Poisson expectation.

- **Multiple testing correction:**  
  - **Benjamini–Hochberg FDR (False Discovery Rate)** applied to peak p-values.  
  - Prevents inflated false positives from millions of independent tests.

- **Functional annotation:** Link peaks to nearby genes or regulatory elements.

## Negative Binomial Model in ChIP-seq Peak Calling

If \(X_i\) is the read count in region \(i\), then under the Negative Binomial (NB) model:

![equation](https://latex.codecogs.com/svg.latex?\color{white}X_i%20\sim%20NB(\mu_i,%20\theta))

Where:
- ![equation](https://latex.codecogs.com/svg.latex?\color{white}\mu_i) is the **mean read count**, estimated from background (e.g., control or genomic average).
- ![equation](https://latex.codecogs.com/svg.latex?\color{white}\theta) is the **dispersion parameter**, which controls the variance.

The **variance** of the Negative Binomial distribution is:

![equation](https://latex.codecogs.com/svg.latex?\color{white}Var(X_i)%20=%20\mu_i%20+%20\frac{\mu_i^2}{\theta})

This allows **overdispersion** (variance > mean), which is common in sequencing data.

---

## Hypothesis Testing for Peak Calling

We test whether a region is significantly enriched (a peak) by comparing the observed count to what is expected under the background NB model.

**Null Hypothesis (H₀):**

![equation](https://latex.codecogs.com/svg.latex?\color{white}X_i%20\sim%20NB(\mu_i,%20\theta))

The read count in region \(i\) follows the background distribution — **not a peak**.

**Alternative Hypothesis (Hₐ):**

![equation](https://latex.codecogs.com/svg.latex?%5Ccolor%7Bwhite%7D%20X_i%20%5Ctext%7B%20significantly%20higher%20than%20expected%20under%20NB%20%7D%20%5CRightarrow%20%5Ctext%7B%20peak%20%7D)

We compute a **p-value** or **false discovery rate (FDR)** to determine significance.  
If it's below a chosen threshold (e.g., FDR < 0.05), we call the region a **peak**.




---

## References
1. Shah, A. *Chromatin immunoprecipitation sequencing (ChIP-Seq) on the SOLiD™ system*. Nat Methods 6, ii–iii (2009). [DOI](https://doi.org/10.1038/nmeth.f.247)  
2. Nakato R, Sakata T. *Methods for ChIP-seq analysis: A practical workflow and advanced applications*. Methods. 2021 Mar;187:44-53. doi: 10.1016/j.ymeth.2020.03.005  
3. Zhang, Y., Liu, T., Meyer, C. A., et al. (2008). *Model-based Analysis of ChIP-Seq (MACS)*. Genome Biology, 9(9), R137.  
4. Benjamini, Y., & Hochberg, Y. (1995). *Controlling the False Discovery Rate: A Practical and Powerful Approach to Multiple Testing*. Journal of the Royal Statistical Society: Series B, 57(1), 289–300.



## Prompts 

ChatGPT: Summarize briefly the mechanisms, applications and estimation methods of ChIP-Seq, cite your resources


ChatGPT: write a short summary about the chip seq assay


DeepSeek: Computational analysis uses statistical models to distinguish true binding sites from background noise (Poisson/negative binomial models for peak calling, FDR correction for multiple testing, and GLMs for differential binding). Can you explain EXACTLY how these methods correlate to Chip seq, give examples and cite sources?


