# geneset_commons
A community resource of reproducible gene sets

## Purpose
Gene sets are a valuable resource in the genomics community but typically the workflows for generating them are not open source and the reproducibility is under question. 
This repository enables researchers to contribute reproducible workflows which generate gene sets. 

## How it works
Contributors will raise an issue in this repository with a link to their own repository which contains one or more R markdown files that detail the generation of the gene sets. 
These Rmarkdown files will be run by a docker container to generate the gene sets.
The Rmarkdown file generates a HTML report which will undergo expert review.
After review, the workflow will be added to the geneset resource.

## History
This [blog post from 2015](http://genomespot.blogspot.com/2015/03/are-we-ready-to-move-beyond-msigdb-and.html) goes into a bit more detail about the problem being addressed here.
