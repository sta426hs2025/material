

techs <- c("imaging-based-spatial-transcriptomics",
           "sequencing-based-spatial-transcriptomics", 
           "bulk-rna-sequencing", 
           "long-read-rna-sequencing", 
           "single-cell-rna-sequencing",
           "single-cell-atac-sequencing",
           "flow-cytometry",
           "mass-cytometry",
           "tandem-mass-spectrometry",
           "electrophysiology-patch-clamp")

eg <- expand.grid(1:5,c("L","R"))
rows <- apply(eg, 1, function(u) paste0(u,collapse=""))

set.seed(20250925)
s <- sample(length(techs))
df <- data.frame(row=rows[s], tech=c(techs))


o <- order(df$row)
df[o,]


