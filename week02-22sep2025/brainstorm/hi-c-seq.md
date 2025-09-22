# Sequencing Assay Summary
## Assay: Hi-C (Hi-C-Seq)
### Technology
Hi-C is a genome-wide chromosome conformation capture method.
It works by:
1. Crosslinking chromatin to preserve 3D contacts.
2. Cutting DNA with restriction enzymes.
3. Performing proximity ligation, joining DNA fragments that were physically close in the nucleus.
4. Enriching ligation junctions (biotin pull-down).
5. Sequencing paired-end reads with next-generation sequencing (NGS).
Each read pair represents two genomic loci that were spatially proximal in 3D space.
---
### Applications
Hi-C sequencing is used to study:
- **3D genome architecture** (A/B compartments, TADs, chromatin loops)
- **Gene regulation** (linking enhancers with target genes)
- **Structural variation in disease** (e.g., cancer rearrangements)
- **Genome assembly scaffolding** (ordering and orienting contigs)
---
### Statistics
Hi-C data is represented as a contact matrix. Key statistical methods include:
- **Poisson / Negative Binomial models** for read-pair contact counts
- **Normalization**: ICE (Iterative Correction and Eigenvector decomposition) to remove biases
- **PCA**: to separate A/B chromatin compartments
- **Loop detection**: enrichment testing using models like Fit-Hi-C or HiCCUPS
  - **Fit-Hi-C**: fits a spline to model expected contact probability as a function of genomic distance; tests each locus pair for enrichment using a binomial/negative binomial test with FDR correction.
  - **HiCCUPS**: identifies local contact enrichments by scanning for “hotspots” in the contact matrix (donut-shaped filters) and comparing against local background; widely used in the Juicer pipeline.
---
## Linking Technology → Applications → Statistics
| Technology      | Applications                              | Statistics                                      |
|-----------------|-------------------------------------------|------------------------------------------------|
| Hi-C sequencing | 3D genome architecture (compartments, TADs, loops); gene regulation; structural variation | Poisson / Negative Binomial modeling of contact counts; ICE normalization; PCA for compartments; loop detection algorithms |
---
## Group Members
- GitHub usernames: dwiedario, evbkel, d-franzen, AnicaBischof
---
## References
- Lieberman-Aiden, E. et al. (2009). Comprehensive mapping of long-range interactions reveals folding principles of the human genome. *Science*, 326(5950), 289–293.
- Mardis, E. R. (2010). Next-generation DNA sequencing technologies. *Science*, 327(5961), 36–43. https://doi.org/10.1126/science.1181369
- Rao, S. S. P. et al. (2014). A 3D map of the human genome at kilobase resolution reveals principles of chromatin looping. *Cell*, 159(7), 1665–1680.
- We prompted ChatGPT with an image of the task, proof-read the output and did some further formatting.
