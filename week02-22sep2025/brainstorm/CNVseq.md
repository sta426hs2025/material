Group 4L, users: izzyschlegel, julholl, mikeF-lab
Technology: CNV-seq. CNV-seq is a bioinformatics tool used to analyze CNV, or copy number variants. CNV-seq is described in Xi and Tammi's 2009 paper [1].
It uses shotgun NGS sequencing for data acquisition, as oppposed to older micro-array methods like aCGH. Post sequencing analysis is done by comparing Poisson
distribution of the test genome to the reference genome. The Poisson parameter is calculated using the ratio between the number of reads in a sliding window to 
the size of the genome. Statistical methods are utilized, such as Hidden Markov Model and regression models, in order to segment the sequence data. Use-cases
for CNV-seq include pre-natal fetal analysis and cancer genotyping. 
technology -> application -> statistics



[1] https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-80
