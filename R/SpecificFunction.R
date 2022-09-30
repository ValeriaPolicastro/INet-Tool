#' SpecificNet
#'
#' @description creates Case Specific Networks one for each layer to give
#' information of the peculiar layer not present in the Consensus.
#' @param graphsL list of weighted graphs in igraph format.
#' @param graphConsensus output of ConsensusAlgorithm.
#'
#' @return Case Specific Networks one for each layer.
#' @export
#' @import igraph
#'
#' @examples
#' gI <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gI)$weight <- runif(igraph::ecount(gI),0.5,1)
#' gII <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gII)$weight <- runif(igraph::ecount(gII),0.5,1)
#' graphsList <- list(gI,gII)
#'
#' MatI <- igraph::as_adjacency_matrix(graph= gI,attr = "weight")
#' MatII <- igraph::as_adjacency_matrix( graph= gII, attr = "weight")
#' my_AdjMatrices <- list(MatI,MatII)
#'
#' my_Consensus <- ConsensusAlgorithm(adjMatL=my_AdjMatrices, tolerance=0.1,
#' theta=0.04, ThresholdConsensus=0.5, nitermax=50,ncores=2)
#'
#' SpecificNet(graphsL=graphsList,graphConsensus=my_Consensus$graphConsensus)



SpecificNet <- function (graphsL,graphConsensus)


{

    GraphsDifference <- list()
    percentuageOfSpecificity <- NULL
    ###### SpecificNet
    for (t in 1:length(graphsL))
    {

        GraphsDifference[[t]] <- igraph::difference(graphsL[[t]],graphConsensus)
        names(GraphsDifference)[[t]] <- names(graphsL)[[t]]
        percentuageOfSpecificity <- c(percentuageOfSpecificity,ecount(GraphsDifference[[t]])/ecount(graphsL[[t]]))

       }


    output <- list(GraphsDifference=GraphsDifference,
                   percentuageOfSpecificity=percentuageOfSpecificity)

    return(output)

    }
