Group members (GitHub usernames):

- Sara Cristina Burckhardt (scburckhardt)
- Maruša Koderman (marusakod)
- Pauline Busch (pauline-busch)

# Ribo-seq

## Method description

Ribosome profiling or Ribo-seq is a method based on sequencing of ribosome-protected mRNA fragments. It provides a genome-wide “snapshot” of all the ribosomes active in a cell at a specific time point. This information can help researchers determine which proteins are being actively translated in a cell. In combination with high-throughput sequencing, ribosome profiling allows detailed and accurate analysis of protein production.[^1]

The method works by taking advantage of the fact that a ribosome physically protects a small segment of mRNA as it moves along the transcript. It includes the following steps[^2]:

1. **Stop translation**: Cells are treated with a chemical, like cycloheximide, to freeze the ribosomes in place on the mRNA.
2. **Digest unprotected RNA**: A nuclease enzyme is added to the cell lysate. This enzyme degrades all the mRNA that isn't protected by a ribosome.
3. **Isolate protected fragments**: The small mRNA fragments that were protected, known as ribosome-protected fragments (RPFs), are isolated from the rest of the cellular material. These fragments are typically about 28-30 nucleotides long.
4. **Sequencing**: The RPFs are then converted to a sequencing library and sequenced using high-throughput sequencing. Sequence reads are mapped to the genome.

## Applications

The main applications of the method include [^3]:
- Measuring differential gene expression at the level of mRNA translation.
- Identification of translated sequences.
- Mapping sites of translation initiation.
- Identification of novel protein coding genes and ribosome pausing.
- Studying mechanisms of protein synthesis, translation control, and process of viral infection.

## Statistics

The analysis of Ribo-seq data involves various statistical methods. Differential translation efficiency (DTE) analysis and differential gene expression (DGE) analysis are described in detail in the following sections.

### Differential gene expression (DGE) analysis: 

DGE analysis uses tools like DESeq2 or EdgeR to identify genes with significant changes in ribosome occupancy between different samples or conditions. This involves comparing the count data from Ribo-seq experiments, treating RPFs as the measure of gene expression at the translational level. Both edgeR and DESeq2 are statistical packages for analyzing RNA-seq count data to find differentially expressed genes (DEGs). The core statistical model for both packages is the negative binomial distribution. [^4],[^5]

### Differential Translation Efficiency (DTE) Analysis

DTE analysis identifies genes whose translational efficiency changes between conditions. This is defined as the ratio of ribosome occupancy to mRNA abundance. This analysis requires both Ribo-seq and a matched RNA-seq experiment. Methods like Riborex use a generalized linear model (GLM) to compare the ratio of Ribo-seq counts to RNA-seq counts, which allows them to distinguish between changes in gene expression driven by changes in mRNA levels (transcriptional regulation) and those driven by changes in translation (translational regulation).[^6]

## Summary

| Technology | Applications | Statistics |
| ---------- | ------------ | ---------- |
| Ribo-seq   | DGE analysis | negative bionomial |
| Ribo-seq   | DTE analysis | generalized linear model |


<!-- citations -->

[^1]: Illumina: "Ribosome Profiling." Illumina, Inc. Accessed September 22, 2025. https://www.illumina.com/techniques/sequencing/rna-sequencing/ribosome-profiling.html
[^2]: Ingolia NT, Ghaemmaghami S, Newman JRS, Weissman JS. Genome-wide analysis in vivo of translation with nucleotide resolution using ribosome profiling. Science. 2009 Apr 10;324(5924):218–23.
[^3]: "Overview of Ribosome Profiling: Definition, Applications, Principles, and Workflow." CD Genomics. Accessed September 22, 2025. https://www.cd-genomics.com/overview-of-ribosome-profiling-definition-applications-principles-and-workflow.html
[^4]: Chen Y, Chen L, Lun ATL, Baldoni PL, Smyth GK. edgeR v4: powerful differential analysis of sequencing data with expanded functionality and improved support for small counts and larger datasets. Nucleic Acids Res [Internet]. 2025 Jan 11;53(2). Available from: http://dx.doi.org/10.1093/nar/gkaf018
[^5]: Love MI, Huber W, Anders S. Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biol. 2014;15(12):550.
[^6]: Li W, Wang W, Uren PJ, Penalva LOF, Smith AD. Riborex: fast and flexible identification of differential translation from Ribo-seq data. Bioinformatics. 2017 Jun 1;33(11):1735–7.