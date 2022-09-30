#' Threshold Consensus
#'
#' @description to recontract the Consensus Network with different Thresholding
#' after the INet algorithm starting from the similar graphs.
#' @param adjMatL list of weighted adjacency symmetric matrix where all the
#' nodes are in all the networks in the same order.
#' @param graphsL the list of similarGraphs output of ConsensusAlgorithm
#' function.
#' @param ThresholdConsensus different threshold to compute.
#'
#' @return a new consensus network igraph object.
#' @export
#' @import igraph
#'
#' @examples
#' gI <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gI)$weight <- runif(igraph::ecount(gI),0.5,1)
#' gII <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gII)$weight <- runif(igraph::ecount(gII),0.5,1)
#'
#' MatI <- igraph::as_adjacency_matrix(graph= gI,attr = "weight")
#' MatII <- igraph::as_adjacency_matrix( graph= gII, attr = "weight")
#' my_AdjMatrices <- list(MatI,MatII)
#'
#' my_Consensus <- ConsensusAlgorithm(adjMatL=my_AdjMatrices, tolerance=0.1,
#' theta=0.04, ThresholdConsensus=0.5, nitermax=50,ncores=2)
#' ThresholdConsensus(adjMatL= my_AdjMatrices,
#' graphsL=my_Consensus$similarGraphs, ThresholdConsensus=0)
#'


ThresholdConsensus <- function (adjMatL, graphsL, ThresholdConsensus=0.5)


{

###### Function Consensus
Mat <- vector(mode = "list", length = length(graphsL))
for (z in 1:length(graphsL))
{
  Mat[[z]] <- as.matrix(igraph::as_adjacency_matrix(graphsL[[z]], attr="weight"))
}

matrixMean <- matrix(0, nrow=dim(Mat[[1]])[1], ncol=dim(Mat[[1]])[1])

for (i in 1:dim(Mat[[1]])[1])
{
  for(j in 1:dim(Mat[[1]])[2]){

    vect <- NULL
    for(k in 1:length(Mat))
    {
      Weig <- c(Mat[[k]][i,j])
      vect <- c(vect,Weig)
    }

    matrixMean[i,j] <- mean(vect)


  }
}
matrix <- as.matrix(matrixMean)
matrix[matrix < ThresholdConsensus] <- 0
rownames(matrix) <- rownames(adjMatL[[1]])
colnames(matrix) <- colnames(adjMatL[[1]])

graphConsensus <- igraph::graph_from_adjacency_matrix(matrix, mode = "upper", diag = FALSE, weighted = TRUE)

return(graphConsensus)
}
