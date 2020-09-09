suppressPackageStartupMessages({
  # cran
  library("devtools")
  library("ActivePathways")
  library("gplots") 
  
  # bioconductor
  library("getDEE2")
  library("DESeq2")
  library("edgeR")
  })

# tool to write gmt file


# let's assume species is human for now
SPECIES = "hsapiens"

main<-function(x1) {
  
  message(x1)
  
  # define the SRP
  SRP = strsplit(x1,":")[[1]][1]
  
  
  # define contrast name
  contrast_name = strsplit(x1,":")[[1]][2]
  
  # get control group info
  control = strsplit(x1,":")[[1]][3]
  
  # get control group name
  control_name = strsplit(control,";")[[1]][1]
  
  # get control groups samples
  # note that we are extracting SRX data not SRR
  control_data = strsplit(control,";")[[1]][2]
  control_data <- unlist(strsplit(control_data, ","))
  control_data <- gsub(" ","",control_data)
  
  # get case group info
  case = strsplit(x1,":")[[1]][4]
  
  # get case group name
  case_name = strsplit(case,";")[[1]][1]
  
  # get case groups samples
  case_data = strsplit(case,";")[[1]][2]
  case_data <- unlist(strsplit(case_data, ","))
  case_data <- gsub(" ","",case_data)
  
  # set up the sample sheet starting with a list of samples
  ss <- as.data.frame(paste(c(control_data,case_data),sep=","),stringsAsFactors=FALSE)
  colnames(ss) <- SRP
  
  # define case group
  ss$case <- as.numeric(ss[,1] %in% case_data)
  ss
  
  # set up the model
  mm <- model.matrix(~case,ss)
  rownames(mm) <- ss[,1]
  mm
  
  # get the data from the database
  mdat <- getDEE2::getDEE2Metadata(species = SPECIES)
  
  # filter for samples in this study
  mdat1 <- mdat[which(mdat$SRP_accession==SRP),]
  
  # filter for only the relevant samples
  mdat1 <- mdat1[which(mdat1$SRX_accession %in% rownames(mm)),]
  
  # show the file
  mdat1
  
  # fetch the data
  y <- getDEE2(SRRvec = mdat1$SRR_accession, species = SPECIES, metadata = mdat,legacy = TRUE)
  
  # look at the data structure
  str(y)
  head(y$GeneCounts)
  
  # remove failed runs - gotta be removed from metadata as well
  pass <- y$GeneCounts[,grep("FAIL",y$MetadataSummary$QC_summary,invert = TRUE)]
  dim(pass)
  
  if (is.null(ncol(pass))) {
    return(paste("Only one sample available",SRP))
  } 
  
  if (ncol(pass)==0) {
    return(paste("No runs passing QC for",SRP))
  } else {
    y$GeneCounts <- pass
    y$MetadataSummary <- y$MetadataSummary[which(rownames(y$MetadataSummary) %in% colnames(pass)),]
  }
   
  # aggregate to experiment level
  yy <- getDEE2::srx_agg(y,counts="GeneCounts")
  
  # show the count matrix
  head(yy)
  
  # stick on the gene names
  rownames(yy) <- paste(rownames(yy),as.character(y$GeneInfo$GeneSymbol),sep=" ")
  
  # remove genes with fewer than 10 reads
  yy <- yy[which(rowMeans(yy)>10),]
  
  # remove samples with fewer than 1000 expressed genes
  n_expressed_genes <- apply(yy,2,function(x) { length(which(x>10)) } ) 
  yy <- yy[,which(n_expressed_genes > 1000)]
  dim(yy)
  
  # remove data from sampleshet and modelmatrix
  ss <- ss[which(ss[,1] %in% colnames(yy)),]
  mm <- mm[which(rownames(mm) %in% colnames(yy)),]

  # make sure that control and treatment have 2 or more replicates
  n_ctrls=length(which(ss$case==0))
  n_cases=length(which(ss$case==1))
  
  if (n_ctrls<2) { return("There are fewer than two samples in the control group") }
  if (n_cases<2) { return("There are fewer than two samples in the case group") }
  
  MDS <- function(x,ss, ...) {
    mydist <- cmdscale(dist(t(x)))
    myrange <- range(mydist[,1])*1.3
    colour_palette <- c("blue","red")
    colours <- colour_palette[as.integer(factor(ss$case))]
    plot(mydist, xlab="Coordinate 1", ylab="Coordinate 2", 
         type = "n", main=colnames(ss)[1], xlim=myrange,  ...)
    text(mydist, labels=ss[,1], cex=0.9, col=colours) 
  }
    
  MDS(yy, ss )
  
  dds=NULL
  dds <- DESeqDataSetFromMatrix(countData = yy, colData = ss, design= mm )
  dds <- DESeq(dds)
  de <- results(dds)
  
  #library(topconfects)
  #confects <- deseq2_confects(dds)
  #str(confects)
  
  # RPM
  yyy <- yy/colMeans(yy) * 1000000
  res <- cbind(de,yyy,yy)
  res <- res[order(res$pvalue),]
  res[1:10,1:6]
  
  # define up and down-regulated gene lists
  up <- head(rownames(subset(de, log2FoldChange>0 & padj<0.05 )),500)
  dn <- head(rownames(subset(de, log2FoldChange<0 & padj<0.05 )),500)
  
  # MA plot
  sig <-subset(de, padj < 0.05 )
  GENESUP <- length(up)
  GENESDN <- length(dn)
  SUBHEADER = paste(GENESUP, "up, ", GENESDN, "down")
  ns <-subset(de, padj > 0.05 )
  plot(log2(de$baseMean),de$log2FoldChange, 
       xlab="log2 basemean", ylab="log2 foldchange",
       pch=19, cex=0.5, col="dark gray",
       main=contrast_name, cex.main=0.7)
  points(log2(sig$baseMean),sig$log2FoldChange,
         pch=19, cex=0.5, col="red")
  mtext(SUBHEADER,cex = 0.7)
  
  top <- res[1:40,7:ncol(res)]
  top <- top[,1:(ncol(top)/2)]
  colfunc <- colorRampPalette(c("blue", "white", "red"))
  
  colCols <- as.character(ss$case)
  colCols <- gsub("1","orange",colCols)
  colCols <- gsub("0","yellow",colCols)
  
  heatmap.2(  as.matrix(top), col=colfunc(25),scale="row", trace="none",
              margins = c(6,6), cexRow=.4, cexCol = 0.6, main=SRP,
              ColSideColors = colCols )
  
  # curate the gene sets
  if(length(up)>9) {
    upg <- unique(sapply(strsplit(up," "),"[[",2)) 
    setid = paste(SRP, contrast_name," upregulated",sep=":")
    setname = paste("GeneSetCommons",SRP,as.integer(as.numeric(Sys.time())),sep=" ")
    upgs <- list("id"=setid,"name"=setname,"genes"=upg)
  } else {
    upgs=NULL
  }
  
  if(length(dn)>9) {
    dng <- unique(sapply(strsplit(dn," "),"[[",2)) 
    setid = paste(SRP, contrast_name," downregulated",sep=":")
    setname = paste("GeneSetCommons",SRP,as.integer(as.numeric(Sys.time())),sep=" ")
    dngs <- list("id"=setid,"name"=setname,"genes"=dng)
  } else {
    dngs=NULL
  }
  
  mysets <- list(upgs,dngs)
  class(mysets) <- "GMT"
  filename = paste("GeneSetCommons",SRP,as.integer(as.numeric(Sys.time())),"gmt",sep=".")
  if(!dir.exists("gmt")){ dir.create("gmt")}
  write.GMT(mysets,paste("gmt/",filename))
}
mysession <- sessionInfo()


