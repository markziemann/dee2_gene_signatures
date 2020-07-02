# Background

In this document we will describe the utility of tools like pathway analysis.
This document does not go into any great detail, but has sufficient references that you can study and take your understanding further.

# Pathway analysis

The need for pathway analysis stems from the development of technologies that could measure the abundance of many thousands of genes, transcripts or proteins in a sample of interest (Bumgarner 2013).
Once this was made possible, researchers could see how the abundance of these analytes changes in response to different stimuli and differs in various pathologies.
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

# References
Bumgarner R. Overview of DNA microarrays: types, applications, and their future. Curr Protoc Mol Biol. 2013;Chapter 22:Unit-22.1. doi:10.1002/0471142727.mb2201s101

Tusher VG, Tibshirani R, Chu G. Significance analysis of microarrays applied to the ionizing radiation response [published correction appears in Proc Natl Acad Sci U S A 2001 Aug 28;98(18):10515]. Proc Natl Acad Sci U S A. 2001;98(9):5116-5121. doi:10.1073/pnas.091062498

Dennis G Jr, Sherman BT, Hosack DA, et al. DAVID: Database for Annotation, Visualization, and Integrated Discovery. Genome Biol. 2003;4(5):P3. https://pubmed.ncbi.nlm.nih.gov/12734009/

Subramanian A, Tamayo P, Mootha VK, Mukherjee S, Ebert BL, Gillette MA, et al. Gene set enrichment analysis: a knowledge-based approach for interpreting genome-wide expression profiles. Proc Natl Acad Sci U S A. 2005. https://doi.org/10.1073/pnas.0506580102.

Khatri P, Sirota M, Butte AJ. Ten years of pathway analysis: current approaches and outstanding challenges. PLoS Comput Biol. 2012;8(2):e1002375. https://doi.org/10.1371/journal.pcbi.1002375.

Liu Y, Chance MR. Pathway analyses and understanding disease associations. Curr Genet Med Rep. 2013. https://doi.org/10.1007/s40142-013-0025-3.

García-Campos MA, Espinal-Enríquez J, Hernández-Lemus E. Pathway analysis: state of the art. Front Physiol. 2015. https://doi.org/10.3389/fphys.2015.00383.

Nguyen TM, Shafi A, Nguyen T, Draghici S. Identifying significantly impacted pathways: a comprehensive review and assessment. Genome Biol. 2019 Oct 9;20(1):203. https://doi.org/10.1186/s13059-019-1790-4.
