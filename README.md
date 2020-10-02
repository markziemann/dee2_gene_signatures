# DEE2 gene signatures

DEE2 is the world's largest set of processed RNA-seq data (http://dee2.io).
We made use of this dataset by curating human disease related data into gene sets for use in enrichment analysis with tools such as [GSEA](https://pubmed.ncbi.nlm.nih.gov/16199517/) and [mitch](https://pubmed.ncbi.nlm.nih.gov/32600408/).
In this pilot project, our focus was on human diseases including diabetes, heart disease, epilepsy and viral infection (SARS/MERS/SARS-CoV-2). 

## What gene signatures are available?

| Library       | No. sets |
| ----  |:----|
| Epilepsy      | 12 |
| Diabetes      | 129 |
| Heart disease | 50 |
| SARS,MERS,SARS-CoV-2 | 66 |

These gene sets are available from the [DEE2 website](http://dee2.io/genesets.html)

## How were the gene signatures were created?

We used a keyword search at [NCBI GEO](https://www.ncbi.nlm.nih.gov/gds/) and then intersected this list of GEO series with studies included in [DEE2](http://dee2.io/huge/).
This process was performed using the [searchDEE2.Rmd script](https://github.com/markziemann/dee2_gene_signatures/blob/master/searchDEE2.Rmd).

Next, we used a number of criteria to determine the suitability of the data for inclusion.

1. The study is relevant to the disease.

2. The study involves samples that can be compared, for example control and disease groups.

4. The data is available at DEE2 and passes QC filtering. QC "FAIL" data sets are excluded.

3. The experiment is replicated, that means n>2 for each condition after QC filtering.

If the study contrasts pass these conditions then it can be included.
For each disease theme, a new markdown file was created and contains the four sections


## How can I contribute

Create an issue on an existing theme or create a new theme.
Each 

## Criteria
In order to be included in GSC, the workflow needs to:

1. Obtain data from a public source, without need for individual login.

2. Be analysed with state of the art tools and consistent with best biostatistical practices.

3. Associate genes with Ensembl gene identifiers.

4. Yield accepted gene signature format file.

5. Workflows need to be publicly accessible and may need to undergo review and amendments if accepted.

## History
This [blog post from 2015](http://genomespot.blogspot.com/2015/03/are-we-ready-to-move-beyond-msigdb-and.html) goes into a bit more detail about the problem being addressed here.


