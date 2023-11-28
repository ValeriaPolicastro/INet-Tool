#' specificNet
#'
#' @description The function creates Case Specific Networks one for each layer
#' to give information of the peculiar layer not present in the Consensus.
#' @param adjL list of weighted adjacency matrix with the SAME nodes in rows
#' and columns for all the matrices.
#' @param graph.consensus **graphConsensus** output of consensusNet function.
#'
#' @return Case Specific Networks one for each layer and percentage of
#' specificity.
#' @export
#' @import igraph
#'
#' @examples
#' data("adjL_data")
#' myConsensus <- consensusNet(adjL_data)
#' specificNet(adjL_data, myConsensus$graphConsensus)


specificNet <- function (adjL, graph.consensus)


{

  ##### Convert adjacency Matrix in graph as it need it
  graph <- vector(mode = "list", length = length(adjL))
  for (t in 1:length(adjL))
  {
    if(length(rownames(adjL[[1]]))>0)
    {
      graph[[t]] <- igraph::graph_from_adjacency_matrix(adjL[[t]],
                                                        mode = "upper",
                                                        diag = FALSE,
                                                        add.colnames = "NA",
                                                        weighted = TRUE)

    }else{
      graph[[t]] <- igraph::graph_from_adjacency_matrix(adjL[[t]],
                                                        mode = "upper",
                                                        diag = FALSE,
                                                        weighted = TRUE)
    }
  }


  GraphsDifference <- list()
    percentageOfSpecificity <- NULL
    ###### SpecificNet
    for (t in 1:length(graph))
    {

        GraphsDifference[[t]] <- igraph::difference(graph[[t]], graph.consensus)
        names(GraphsDifference)[[t]] <- names(graph)[[t]]
        percentageOfSpecificity <- c(percentageOfSpecificity,
                                     ecount(GraphsDifference[[t]])/ecount(graph[[t]]))

    }


    output <- list(GraphsDifference=GraphsDifference,
                   percentageOfSpecificity=percentageOfSpecificity)

    return(output)

    }
