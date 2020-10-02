# Background

In this document we will describe the utility of tools like pathway analysis.
This document does not go into any great detail, but has sufficient references that you can study and take your understanding further.

# Pathway analysis

The need for pathway analysis stems from the development of technologies that could measure the abundance of many thousands of genes, transcripts or proteins in a sample of interest (Bumgarner 2013).
Once these "omics" technologies were made possible, researchers could see how the abundance of these analytes changed in response to different stimuli and differs in various pathologies.
Statistical methods were quickly developed to test whether individual analytes were differentially abundant in these comparisons (Tusher et al, 2001), but it is also desirable to know of the trends regarding groups of functionally linked genes, such as signaling or biochemical pathways.

Imagine you have run a microarray gene expression analysis in control and disease samples and after statistical analysis you have 1000 gene that are up regulated and another 1000 downregulated. How should you make sense of all these many changes taking place? How can existing knowledge about the importance of certain biochemical or signaling pathways disease be tested? 
For example in a study involving control and diabetic samples, how can we test the hypothesis that persons with diabetes have poorer mitochondrial function?
What we would like to know is _are genes with certain functions enriched among up- or down-regulated genes?_.

This alludes to the more concrete term _enrichment analysis_ for which there have been very many proposed solutions.
I will not describe all variations here, however I will point to two major paradigms. 
Firstly, over-representation analysis as typified by DAVID enrichment tool (Dennis et al, 2003).
Secondly, functional class sorting as typified by the gene set enrichment technique (GSEA; Subramanian et al, 2005).
For a more detailed explanation of the many techniques and their development over time, please refer to the review articles (Khatri et al, 2012; Liu et al, 2013; García-Campos et al, 2015; Nguyen et al, 2019).

# Gene sets

For these techniques to work properly, they require gene annotation information.
For example a list of genes associated with mitochondrial function in order to test the hypothesis above.
Consortiums emerged that focused on annotating genes with functions in a systematic way. 
They established databases of gene-function linkages covering biochemical and signaling pathways that were mined from the literature.
Some examples of these include:

* Kyoto Encyclopedia of Genes and Genomes (KEGG; Kanehisa & Sato 2016)

* The Gene Ontology Resource / PANTHER (GO; Mi et al, 2019)

* The Reactome Pathway Knowledgebase (Jassal et al, 2020)

* Pathway Commons (Rodchenkov et al, 2020)

Some gene set databases are not only based on functional data, but based themselves on high throughput measurements:

* DSigDB: drug signatures database for gene set analysis (Yoo et al, 2015)

* miRTarBase: experimentally validated microRNA-target interactions (Chou et al, 2018)

* GTRD: transcription factor target database (Yevshin et al, 2019)

Moreover there are additional databases of gene sets aggregated from curation consortia as well as contributed by the community on the basis of other features:

* The Molecular Signatures Database (MSigDB; Liberzon et al, 2011)

* GeneSetDB (Araki et al, 2012)

# Summary

Success in enrichment analysis requires both accurate statistical methods as well as comprehensive gene annotations.
The growth in gene annotation coverage over the past 10 years has been staggering, but it is far from over.
There have been innovative projects aimed towards extracting gene signatures from large omics datasets (Wang et al, 2016; Shah et al, 2016) but there is still much to do.
For example the class of long non-coding genes has over 16,000 members but only a small fraction of these have a described function in the literature and their representation in databases such as GO and REACTOME is nil.

# References
Bumgarner R. Overview of DNA microarrays: types, applications, and their future. Curr Protoc Mol Biol. 2013;Chapter 22:Unit-22.1. https://doi.org/10.1002/0471142727.mb2201s101.

Tusher VG, Tibshirani R, Chu G. Significance analysis of microarrays applied to the ionizing radiation response [published correction appears in Proc Natl Acad Sci U S A 2001 Aug 28;98(18):10515]. Proc Natl Acad Sci U S A. 2001;98(9):5116-5121. https://doi.org/10.1073/pnas.091062498.

Dennis G Jr, Sherman BT, Hosack DA, et al. DAVID: Database for Annotation, Visualization, and Integrated Discovery. Genome Biol. 2003;4(5):P3. https://pubmed.ncbi.nlm.nih.gov/12734009.

Subramanian A, Tamayo P, Mootha VK, Mukherjee S, Ebert BL, Gillette MA, et al. Gene set enrichment analysis: a knowledge-based approach for interpreting genome-wide expression profiles. Proc Natl Acad Sci U S A. 2005. https://doi.org/10.1073/pnas.0506580102.

Khatri P, Sirota M, Butte AJ. Ten years of pathway analysis: current approaches and outstanding challenges. PLoS Comput Biol. 2012;8(2):e1002375. https://doi.org/10.1371/journal.pcbi.1002375.

Liu Y, Chance MR. Pathway analyses and understanding disease associations. Curr Genet Med Rep. 2013. https://doi.org/10.1007/s40142-013-0025-3.

García-Campos MA, Espinal-Enríquez J, Hernández-Lemus E. Pathway analysis: state of the art. Front Physiol. 2015. https://doi.org/10.3389/fphys.2015.00383.

Nguyen TM, Shafi A, Nguyen T, Draghici S. Identifying significantly impacted pathways: a comprehensive review and assessment. Genome Biol. 2019 Oct 9;20(1):203. https://doi.org/10.1186/s13059-019-1790-4.

Kanehisa M, Sato Y, Kawashima M, Furumichi M, Tanabe M. KEGG as a reference resource for gene and protein annotation. Nucleic Acids Res. 2016;44(D1):D457-D462. https://doi.org/10.1093/nar/gkv1070.

Mi H, Muruganujan A, Ebert D, Huang X, Thomas PD. PANTHER version 14: more genomes, a new PANTHER GO-slim and improvements in enrichment analysis tools. Nucleic Acids Res. 2019;47(D1):D419-D426. https://doi.org/10.1093/nar/gky1038.

Jassal B, Matthews L, Viteri G, et al. The reactome pathway knowledgebase. Nucleic Acids Res. 2020;48(D1):D498-D503. https://doi.org/10.1093/nar/gkz1031

Rodchenkov I, Babur O, Luna A, et al. Pathway Commons 2019 Update: integration, analysis and exploration of pathway data. Nucleic Acids Res. 2020;48(D1):D489-D497. https://doi.org/10.1093/nar/gkz946.

Yoo M, Shin J, Kim J, et al. DSigDB: drug signatures database for gene set analysis. Bioinformatics. 2015;31(18):3069-3071. https://doi.org/10.1093/bioinformatics/btv313

Chou CH, Shrestha S, Yang CD, et al. miRTarBase update 2018: a resource for experimentally validated microRNA-target interactions. Nucleic Acids Res. 2018;46(D1):D296-D302. https://doi.org/10.1093/nar/gkx1067.

Yevshin I, Sharipov R, Kolmykov S, Kondrakhin Y, Kolpakov F. GTRD: a database on gene transcription regulation-2019 update. Nucleic Acids Res. 2019;47(D1):D100-D105. doi:10.1093/nar/gky1128

Liberzon A, Subramanian A, Pinchback R, Thorvaldsdóttir H, Tamayo P, Mesirov JP. Molecular signatures database (MSigDB) 3.0. Bioinformatics. 2011;27(12):1739-1740. https://doi.org/10.1093/bioinformatics/btr260.

Araki H, Knapp C, Tsai P, Print C. GeneSetDB: A comprehensive meta-database, statistical and visualisation framework for gene set analysis. FEBS Open Bio. 2012;2:76-82. Published 2012 Apr 17. https://doi.org/10.1016/j.fob.2012.04.003

Wang Z, Monteiro CD, Jagodnik KM, et al. Extraction and analysis of signatures from the Gene Expression Omnibus by the crowd. Nat Commun. 2016;7:12846. Published 2016 Sep 26. https://doi.org/10.1038/ncomms12846.

Shah N, Guo Y, Wendelsdorf KV, Lu Y, Sparks R, Tsang JS. A crowdsourcing approach for reusing and meta-analyzing gene expression data. Nat Biotechnol. 2016;34(8):803-806. https://doi.org/10.1038/nbt.3603.
