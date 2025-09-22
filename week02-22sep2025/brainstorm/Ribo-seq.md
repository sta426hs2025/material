Group members (GitHub usernames):

- Sara Cristina Burckhardt (scburckhardt)
- Maruša Koderman (marusakod)
- Pauline Busch (pauline-busch)

# Ribo-seq

## Method description

Ribosome profiling or Ribo-seq is a method based on sequencing of ribosome-protected mRNA fragments. It provides a genome-wide “snapshot” of all the ribosomes active in a cell at a specific time point. This information can help researchers determine which proteins are being actively translated in a cell. In combination with high-throughput sequencing, ribosome profiling allows detailed and accurate analysis of protein production.[^1]

The method works by taking advantage of the fact that a ribosome physically "protects" a small segment of mRNA as it moves along the transcript.

1. **Stop translation**: Cells are treated with a chemical, like cycloheximide, to freeze the ribosomes in place on the mRNA. This locks them in their exact position.
2. **Digest unprotected RNA**: A nuclease enzyme is added to the cell lysate. This enzyme degrades all the mRNA that isn't protected by a ribosome.
3. **Isolate Protected Fragments**: The small mRNA fragments that were protected, known as ribosome-protected fragments (RPFs) or "footprints," are isolated from the rest of the cellular material. These fragments are typically about 28-30 nucleotides long.
4. **Sequencing**: The RPFs are then converted to a sequencing library and sequenced using next-generation sequencing.
5. **Data analysis**: The sequence reads are mapped back to the genome.[^2]


## Applications
The main applications of the method include:
- Measuring differential gene expression at the level of mRNA translation
- Identification of translated sequences 
- Mapping sites of translation initiation
- Identification of novel protein coding genes and ribosome pausing
- Studying mechanisms of protein synthesis, translation control, and process of viral infection [^3]

## Statistics

The analysis of Ribo-seq data involves various statistical methods:

### Differential gene expression (DGE) analysis: 
Differential gene expression analysi uses tools like DESeq2 or EdgeR to identify genes with significant changes in ribosome occupancy or translational efficiency between different samples or conditions. This involves comparing the count data from Ribo-seq experiments. Both edgeR and DESeq2 are statistical packages for analyzing RNA-seq count data to find differentially expressed genes (DEGs). The core statistical model for both packages is the Negative Binomial (NB) distribution [^4],[^5]

### Differential Translation Efficiency (DTE) Analysis
Aims to identify genes whose translational efficiency changes between conditions. This is defined as the ratio of ribosome occupancy (from Ribo-seq) to mRNA abundance (from a matched RNA-seq experiment).
These methods typically use a generalized linear model (GLM), often with a negative binomial (NB) or Poisson distribution, to directly model the Ribo-seq read counts while accounting for RNA-seq read counts as an offset or covariate. Example: Riborex [^6]

## Summary

| Technology | Applications | Statistics |
| ---------- | ------------ | ---------- |
| Ribo-seq   | DGE and DTE analysis | negative bionomial, GLM, Poisson |


<!-- citations -->

[^1]: Illumina: "Ribosome Profiling." Illumina, Inc. Accessed September 22, 2025. https://www.illumina.com/techniques/sequencing/rna-sequencing/ribosome-profiling.html
[^2]: Ingolia, N. T., Ghaemmaghami, S., Newman, J. R. S., & Weissman, J. S. (2009). Genome-wide analysis in vivo of translation with ribosome profiling. Science, 324(5924), 218–223. doi: 10.1126/science.1168978
[^3]: "Overview of Ribosome Profiling: Definition, Applications, Principles, and Workflow." CD Genomics. Accessed September 22, 2025. https://www.cd-genomics.com/overview-of-ribosome-profiling-definition-applications-principles-and-workflow.html
[^4]: https://academic.oup.com/nar/article/53/2/gkaf018/7973897?login=true 
[^5]: https://genomebiology.biomedcentral.com/articles/10.1186/s13059-014-0550-8 
[^6]: https://academic.oup.com/bioinformatics/article/33/11/1735/2964727