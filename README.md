# Gene Signature Commons
GSC is a community resource of reproducible gene sets.

## Purpose
Gene signatures are a valuable resource in the genomics community but typically the workflows for generating them are not open source and the reproducibility is under question. 
This repository enables researchers to contribute reproducible workflows which generate gene signatures from various omics data. 
We welcome contributions from any researcher, from citizen scientists to major academic labs.

## What are gene signatures?
Normally, gene signatures are sets of genes that have a common feature. 
The standard gene set format is .GMT, however there may be use for more detailed signatures that include information such as fold change, p-values, confidence intervals and the like. 
Genes could be mined from studies or disease, such as GWAS, from epigenetics and gene expression studies.
We actively seek gene sig

## How it works
Contributors will raise an issue in this repository with a link to their own repository which contains one or more R markdown files that detail the generation of the gene sets. 
These Rmarkdown files will be run by a docker container to generate the gene signatures.
The Rmarkdown file generates a HTML report which will undergo expert review.
After review, the workflow will be added to the geneset resource.

## Criteria
In order to be included in GSC, the workflow needs to:

1. Obtain data from a public source, without need for individual login.

2. Be analysed with state of the art tools and consistent with best biostatistical practices.

3. Associate genes with Ensembl gene identifiers.

4. Yield accepted gene signature format file.

5. Workflows need to be publicly accessible and may need to undergo review and amendments if accepted.

## History
This [blog post from 2015](http://genomespot.blogspot.com/2015/03/are-we-ready-to-move-beyond-msigdb-and.html) goes into a bit more detail about the problem being addressed here.
