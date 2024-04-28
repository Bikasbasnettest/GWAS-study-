
source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

#Importing Genotyping data/ here we add the head is false for the Half map file
myG<-read.table("E:/GWAS study file in R/Watkins_axiom35k_genotype_for_Tassel.hmp.txt",head = FALSE)
myG
#Import Phenotyping data
myY <- read.table("E:/GWAS study file in R/Watkins_phenotype_H2006_for_Tassel.txt", head = TRUE)
myY
#Running GWAS
myGAPIT<-GAPIT(
  Y=myY,
  G=myG,
  PCA.total=5,
  SNP.MAF =0.05,
  Multiple_analysis = TRUE,
  model=c("GLM","MLM"),
  Random.model=FALSE
)
library(pdftools)
require(grid)
input_file <- "GAPIT.Association.Manhattans_Circular.pdf"

# Render the page of the PDF
pdf_page <- pdf_render_page(input_file, page = 1)

# Display the rendered page as a plot
grid::grid.raster(pdf_page)
