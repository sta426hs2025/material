Group user names:
- Natallia Halai, GitHub username: natalliahalai
- Florian Hellwig, GitHub username: Smile4heWorld

# CHART-Sequencing
## Definition/Technology
*CHART-Seq (Capture Hybridization Analysis of RNA Targets sequencing)* is a biochemical method used to map the genomic binding sites of long noncoding RNAs (lncRNAs).
It works by designing antisense oligonucleotide probes that hybridize to a specific RNA of interest in crosslinked chromatin.
The probes pull down the RNA together with any associated DNA and proteins.
The DNA is then sequenced to identify the genomic regions where the RNA interacts.
Essentially, CHART-Seq allows researchers to determine where in the genome a specific lncRNA binds.

## Applications
- *Mapping RNA-chromatin interactions*: Helps identify genomic regions targeted by lncRNAs (e.g., roX2 in Drosophila).
- *Studying dosage compensation*: For example, it was first applied to Drosophila roX2 RNA, which binds the male X chromosome in dosage compensation.
- *Understanding regulatory roles of lncRNAs*: CHART-Seq reveals how lncRNAs influence gene expression by showing their binding sites.
- *Comparative analysis*: Used alongside ChIP-seq and other binding assays to link lncRNAs with chromatin-modifying protein complexes.

## Statistics in CHART-Seq
### 1. Read Processing & Alignment
- Raw sequencing reads are **quality controlled** (adapter trimming, filtering low-quality bases).
- Reads are **aligned to the reference genome** (using tools like Bowtie2, STAR, or BWA).
- Only uniquely mapping reads are typically kept to avoid ambiguous assignment.


### 2. Signal vs Background
- CHART-Seq always includes a **control sample** (often a set of non-targeting probes, or an "input" pull-down).
- Reads from the experimental pulldown are compared against controls to assess **enrichment**.
- Statistical models:
  - **Poisson / Negative Binomial tests**: model read counts per genomic window.
  - **Fold-change and enrichment scores**: log₂(experiment/control).
  - **Z-scores**: for standardizing enrichment over expected background.

### 3. Peak Calling
- Similar to ChIP-seq: define genomic regions (bins or windows) with significant enrichment.
- Tools: often adapted versions of **MACS** (Model-based Analysis of ChIP-seq), but tuned for **CHART-Seq data**.
- Models expected background distribution → compute p-values for observed read enrichment.
- Multiple hypothesis testing correction: False Discovery Rate (FDR) control (Benjamini-Hochberg).

### 4. Reproducibility
- Peaks are tested across biological replicates.
- Tools like IDR (Irreproducible Discovery Rate) are sometimes used to filter peaks that consistently appear in replicates.

### 5. Annotation & Integration
- Significant peaks are **mapped to genomic features** (promoters, enhancers, introns, exons).
- Statistical enrichment tests (e.g., Fisher’s exact test, hypergeometric test) determine whether RNA binding sites **overlap** disproportionately with functional regions.
- Integration with other datasets (RNA-seq, ChIP-seq, ATAC-seq) involves correlation analysis (Pearson/Spearman) or co-localization testing.

### 6. Visualization & Significance Metrics
- Genome browser tracks show read enrichment over control.
- Key statistical outputs include:
  - **Fold-enrichment values**
  - **P-values and adjusted q-values (FDR)**
  - **Peak scores** (combined measure of enrichment and reproducibility).


## Sources
- Simon, M. D., et al. (2011). The genomic binding sites of a noncoding RNA. PNAS, 108(51), 20497–20502. [Pnas](https://www.pnas.org/doi/epdf/10.1073/pnas.1113536108)
- Chu, C., Quinn, J., & Chang, H. Y. (2012). Chromatin isolation by RNA purification (ChIRP). J Vis Exp, (61):3912. doi:10.3791/3912 (related methods). [JoVE](https://www.jove.com/v/3912/chromatin-isolation-by-rna-purification-chirp)
- Paige JS, Wu KY, Jaffrey SR. RNA mimics of green fluorescent protein. Science. 2011;333(6042):642-6. doi:10.1126/science.1207339., [Pubmed](https://pubmed.ncbi.nlm.nih.gov/21798953/)
- Simon, M. D. (2013). Capture Hybridization Analysis of RNA Targets (CHART). Current Protocols in Molecular Biology, 101(1), 21.25.1–21.25.16. [Pubmed](https://pubmed.ncbi.nlm.nih.gov/23288463/)
- ENCODE/ChIP-seq standards, Landt et al., 2012; [Pubmed](https://pubmed.ncbi.nlm.nih.gov/22955991/)


## Promps
- ChatGPT: write a short summary about the definition and application of CHART Sequencing, site your sources
- ChatGPT: Could you explain briefly about the link (technology -> application -> statistics) for this technique
- ChatGPT: Could you elaborate more in the statistics part?
