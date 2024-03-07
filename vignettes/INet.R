## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

## ----library------------------------------------------------------------------
# Install from CRAN 
# install.packages("INet")

# Install from GitHub
# install.packages("devtools")
#devtools::install_github("ValeriaPolicastro/INet-package")


## ----data---------------------------------------------------------------------
library(INet)
data("exampleL_data")

## ----construction-------------------------------------------------------------
net <- constructionGraph(exampleL_data)

## -----------------------------------------------------------------------------
graphL <- net$Graphs
JWmatrix(graphL)

## -----------------------------------------------------------------------------
JWmean(graphL)

## -----------------------------------------------------------------------------
measures <- measuresNet(graphL, nodes.measures=F)

## -----------------------------------------------------------------------------
measures[[1]] 

