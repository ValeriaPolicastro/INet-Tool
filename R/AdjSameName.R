#' adjSameName
#' @description it construct a list of adjacency matrices with the SAME nodes
#' in rows and columns
#'
#'
#' @param adjL list of adjacency matrices
#'
#' @return a list of adjacency matrices with the SAME nodes in rows and columns
#' @export
#'
#' @examples
#' data("tryL_data")
#' adjSameName(tryL_data)
#'
adjSameName <- function(adjL)
{

    #### Same name of nodes for all the networks:
  geneName <- NULL
  for (i in 1:length(adjL))
  {
    genename <- rownames(adjL[[i]])
    geneName <- c(geneName,genename)
  }
  genes <- unique(geneName)
  length(genes)


  ####### Create the same names:
  Mat <- vector(mode = "list", length = length(adjL))
  for (z in 1:length(adjL))
  {

    Mat[[z]] <- matrix(0, nrow=length(genes), ncol= length(genes))
    rownames(Mat[[z]]) <- genes
    colnames(Mat[[z]]) <- genes

    for ( i in 1:(dim(adjL[[z]])[1]))
    {

      for (j in 1:(dim(adjL[[z]])[2]))

      {

        valore <- adjL[[z]][rownames(adjL[[z]])[i],
                                      colnames(adjL[[z]])[j]]

        Mat[[z]][which(rownames(Mat[[z]])==rownames(adjL[[z]])[i]),
                 which(colnames(Mat[[z]])==colnames(adjL[[z]])[j])]<- valore

      }


    }

  }

  return(Mat)
}
