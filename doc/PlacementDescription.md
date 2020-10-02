# Gene Signature Commons: Extracting knowledge from public omics data resources

Supervisor: Mark Ziemann

Students: a team of up to five placement students TBC

## Background

Pathway analysis is a key technique in computational biology.
When applied to study gene expression patterns in disease, we can identify biochemical and signalling pathways that are altered, which leads to greater knowledge about the disease and strategies to counteract it.
This gives biomedical scientists new “leads” to pursue and validate in the lab, which has impacts for therapeutic discovery.
This approach has also been used to characterise the effect of drugs on particular cell types or the effect of genetic manipulations.
The effectiveness of pathway analysis is limited by the quality of pathway databases, therefore is a need to develop more comprehensive pathway knowledge.
The conventional approach to this is to trawl the literature for evidence of a particular function (eg: Reactome [1]), although deriving associations from high throughput omics data has it’s benefits.
For example, the MSigDB database already contains hundreds of gene sets (pathways) corresponding to genetic and chemical perturbations, which are widely used in the analysis of different omics data [2].
With the emergence of large-scale omics data hubs, we have the opportunity to generate and contribute novel gene signatures which will benefit the computational biological community.
In this project, a small team will focus on analysing gene expression data sets in the DEE2 database [3] related to diseases such as diabetes, heart disease, and epilepsy, then converting these into gene signatures for future use under a permissive licence. 

## Methods

Our workflow has the following steps:

* Identify gene expression datasets in DEE2 which are related to a disease of interest.

* Download gene expression data from DEE2, and inspect the quality of the dataset. 

* Inspect the sample descriptions at NCBI Short Read Archive [4] to classify the sample groups being compared.
For example deciding which samples are “control” and “disease”.

* Perform differential expression analysis to summarise which genes are altered in their expression in the contrast of interest.

The code used to generate these signatures will be posted to our GitHub repository [5], will undergo code review and be executed by our analysis container which will compile the gene sets.

## Significance

During the course of this project, we will be generating many gene sets that are valuable assets for future omics analysis. These will be contributed to MSigDB [2] for others to use. In addition this project will be showcasing how state of the art software engineering principles such as version control, containerisation and testing can be used to improve the reproducibility of the derivation of such data. This pilot project is a proof-of-concept which we hope will encourage more researchers and citizen scientists to contribute gene signatures to further build the resource.

## Logistics

We will be working in a team of four or five to conduct different parts of this project. Students will be given a specialised task such as:

* Identify datasets of interest, reading papers and classifying samples into control and case groups. This will involve browsing NCBI and DEE2, recording sample metadata.

* Coding gene expression workflows in R/Rstudio.

This work can be performed remotely if you have access to a PC or laptop and internet connection.
Students are expected to invest 80 hours into the project.
You are free to work at your own pace, which means you can contribute 4 to 20 hours per week.
Mark will be providing training via Zoom for all aspects, and we will have weekly group meetings.
This project is centred around GitHub, a software versioning tool, with which we will use to record all contributions and outstanding work items. 

## Feasibility and risk assessment

Supervisor Mark Ziemann has several years experience in biological data mining and is the maintainer of the DEE2 database.
Selected students are enrolled in the Medical Genomics Major in Biomedical Science and are keen to learn tools which will help them toward a career in genomics/bioinformatics.
We have access to sufficient compute resources.
The risks therefore are limited to human factors, team cohesion and ability to pick up and use a new set of tools within a fairly short time-frame. 

## Target journal

F1000 Research BioData Mining, BioMolecules, Genomics, 3G, etc.

## References
1. Jassal B, Matthews L, Viteri G, et al. The reactome pathway knowledgebase. Nucleic Acids Res. 2020;48(D1):D498‐D503. doi:10.1093/nar/gkz1031
2. Liberzon A, Subramanian A, Pinchback R, Thorvaldsdóttir H, Tamayo P, Mesirov JP. Molecular signatures database (MSigDB) 3.0. Bioinformatics. 2011;27(12):1739‐1740. doi:10.1093/bioinformatics/btr260
3. Ziemann M, Kaspi A, El-Osta A. Digital expression explorer 2: a repository of uniformly processed RNA sequencing data. Gigascience. 2019;8(4):giz022. doi:10.1093/gigascience/giz022
4. Kodama Y, Shumway M, Leinonen R; International Nucleotide Sequence Database Collaboration. The Sequence Read Archive: explosive growth of sequencing data. Nucleic Acids Res. 2012;40(Database issue):D54‐D56. doi:10.1093/nar/gkr854
5. Ziemann M. Gene Signature Commons. 2020. Received 1st June 2020 <https://github.com/markziemann/gene_sig_commons>.
