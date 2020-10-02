# Methods

## Contrast curation

We used a keyword search at [NCBI GEO](https://www.ncbi.nlm.nih.gov/gds/) and then intersected this list of GEO series with studies included in [DEE2](http://dee2.io/huge/)[1].
This process was performed using the [searchDEE2.Rmd script](https://github.com/markziemann/dee2_gene_signatures/blob/master/searchDEE2.Rmd).

Next, we used a number of criteria to determine the suitability of the data for inclusion:

1. The study is relevant to the disease.

2. The study involves samples that can be compared, for example control and disease groups.

4. The data is available at DEE2 and passes QC filtering. QC "FAIL" data sets are excluded.

3. The experiment is replicated, that means n>2 for each condition after QC filtering.

If the study contrasts pass these conditions then it can be included.
For each disease theme, a new markdown file was created and contains the four sections

1. Candidate studies: this is the list of GEO series with the keyword and available in DEE2.

2. Studies that fit the criteria. The type of contrast is included here.

3. Studies that don't fit the criteria. The reason why the study is not suitable is also given.

4. Contrasts. For the studies that do fit the criteria, the contrasts are defined related to the SRA project ID (SRP) and the SRA experiment IDs (SRXs) corresponding to the control and case datasets:

`
SRP: Contrast name: Control group name; SRX(control1),SRX(control2),SRX(controlN): Case group name; 
SRX(case1);SRX(case2),SRX(case3)
`

For example:

`
SRP233503:Genes differentially regulated by free fatty acids in HUVECs cells:Ctrl; SRX7228895,SRX7228896,SRX7228897:FFA; SRX7228898,SRX7228899,SRX7228900
`

## Signature generation

Next, the contrasts are analysed using a specially designed pipeline in R (version 4.0.2).
In the "de_analysis" folder there are Rmd files that can be used to regenerate the gene set library for each theme.
These Rmd files use a common set of functions for differential analysis, which are found in the "de_functions.R" file.
First, the contrast information is parsed out so the control and case data are identified.
Next, the gene expression count data are obtained from DEE2 using the "getDEE2" package.
Any SRA runs with QC summary of "FAIL" are excluded.
The remaining datasets are aggregated from runs to experiments.
Genes with fewer than 10 reads per sample on average are excluded.
Next we remove samples with fewer than 1000 expressed genes.
If after this there are fewer than two replicates per group, the contrast is discarded.
Next DESeq2 version1.28.1 [3] was used for differential expression.
Genes indicated as FDR<0.05 were divided into up- and down-regulated groups.
Sets with fewer than 10 genes were discarded.
Sets were aggregated and written as a GMT format.

## Signature analysis

GMT files were read and analysed with the "set_analysis.Rmd" script with R (version 4.0.2).

Human gene annotations were obtained from Ensembl (version 90)[4].
Gene set libraries were also obtained from Reactome (Sept 2020)[5]. 
Gene Ontology annotations were downloaded from Ensembl Biomart (Sept 2020)[6].
Gene sets were also obtained from MSigDB (version 7.2)[7].
Venn diagrams were generated using the eulerr package v6.1.0.
Network diagrams were generated using the network package v1.16.0.
Overrepresentation test using the Fisher test method was performed using the testEnrichment function of the triwise package version 0.99.5.
False discovery rate adjusted p-values (FDR) < 0.05 were considered significant.
For each new gene set, up to five enriched Reactome gene sets with FDR < 0.05 were included in a heatmap using heatmap.2 functon of gplots v3.3.2.


## References

1. Ziemann M, Kaspi A, El-Osta A. Digital expression explorer 2: a repository of uniformly processed RNA sequencing data. Gigascience. 2019 Apr 1;8(4):giz022. doi: 10.1093/gigascience/giz022. PMID: 30942868; PMCID: PMC6446219.

2. Ziemann M, Kaspi A (2020). getDEE2: Programmatic access to the DEE2 RNA expression dataset. R package version 0.99.30, https://github.com/markziemann/getDEE2.

3. Love MI, Huber W, Anders S. Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biol. 2014;15(12):550. doi: 10.1186/s13059-014-0550-8. PMID: 25516281; PMCID: PMC4302049.

4. Yates AD, Achuthan P, Akanni W, Allen J, Allen J, Alvarez-Jarreta J, Amode MR, Armean IM, Azov AG, Bennett R, Bhai J, Billis K, Boddu S, Marugán JC, Cummins C, Davidson C, Dodiya K, Fatima R, Gall A, Giron CG, Gil L, Grego T, Haggerty L, Haskell E, Hourlier T, Izuogu OG, Janacek SH, Juettemann T, Kay M, Lavidas I, Le T, Lemos D, Martinez JG, Maurel T, McDowall M, McMahon A, Mohanan S, Moore B, Nuhn M, Oheh DN, Parker A, Parton A, Patricio M, Sakthivel MP, Abdul Salam AI, Schmitt BM, Schuilenburg H, Sheppard D, Sycheva M, Szuba M, Taylor K, Thormann A, Threadgold G, Vullo A, Walts B, Winterbottom A, Zadissa A, Chakiachvili M, Flint B, Frankish A, Hunt SE, IIsley G, Kostadima M, Langridge N, Loveland JE, Martin FJ, Morales J, Mudge JM, Muffato M, Perry E, Ruffier M, Trevanion SJ, Cunningham F, Howe KL, Zerbino DR, Flicek P. Ensembl 2020. Nucleic Acids Res. 2020 Jan 8;48(D1):D682-D688. doi: 10.1093/nar/gkz966. PMID: 31691826; PMCID: PMC7145704.

5. Jassal B, Matthews L, Viteri G, Gong C, Lorente P, Fabregat A, Sidiropoulos K, Cook J, Gillespie M, Haw R, Loney F, May B, Milacic M, Rothfels K, Sevilla C, Shamovsky V, Shorser S, Varusai T, Weiser J, Wu G, Stein L, Hermjakob H, D'Eustachio P. The reactome pathway knowledgebase. Nucleic Acids Res. 2020 Jan 8;48(D1):D498-D503. doi: 10.1093/nar/gkz1031. PMID: 31691815; PMCID: PMC7145712.

6. Smedley D, Haider S, Ballester B, Holland R, London D, Thorisson G, Kasprzyk A. BioMart--biological queries made easy. BMC Genomics. 2009 Jan 14;10:22. doi: 10.1186/1471-2164-10-22. PMID: 19144180; PMCID: PMC2649164.

7. Liberzon A, Birger C, Thorvaldsdóttir H, Ghandi M, Mesirov JP, Tamayo P. The Molecular Signatures Database (MSigDB) hallmark gene set collection. Cell Syst. 2015 Dec 23;1(6):417-425. doi: 10.1016/j.cels.2015.12.004. PMID: 26771021; PMCID: PMC4707969.

8. 
