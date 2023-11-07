#' measuresNet
#'
#' @description graphs and nodes measures to analyse all the layers in one shot.
#' @param graphsL a list of graphs as igraphs objects.
#' @param NodesMeasures logical, if falso it computes only graph measures, if
#' true it computes also nodes measures (default TRUE).
#'
#' @return list of measure for each layer.
#' @import igraph
#' @export
#'
#' @examples
#' gI <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gI)$weight <- runif(igraph::ecount(gI),0.5,1)
#' gII <- igraph::sample_pa(n=10,directed=FALSE)
#' igraph::E(gII)$weight <- runif(igraph::ecount(gII),0.5,1)
#' graphsList <- list(gI,gII)
#' measuresNet(graphsL=graphsList, NodesMeasures=TRUE)
#'
measuresNet <- function(graphsL, NodesMeasures=TRUE)
{

    MeasuresGraphs <- vector(mode = "list", length = length(graphsL))
   for (i in 1:length(graphsL))
   {
       # graphs Measures
       set.seed(100)
       verte <- igraph::vcount(graphsL[[i]])
       edge <- igraph::ecount(graphsL[[i]])
       tran <- igraph::transitivity(graphsL[[i]],type="global")#Transitivity measures the probability that the adjacent vertices of a vertex are connected. This is sometimes also called the clustering coefficient.
       diam <- igraph::diameter(graphsL[[i]])#The diameter of a graphs is the length of the longest between the shortest path
       modl <- igraph::modularity(graphsL[[i]],cluster_louvain(graphsL[[i]],weights = NULL)$membership)
       den <- igraph::edge_density(graphsL[[i]]) #The density of a graphs is the ratio of the number of edges and the number of possible edges.
       as <- igraph::assortativity_degree(graphsL[[i]]) #The assortativity coefficient is positive if similar vertices (based on some external property) tend to connect to each, and negative otherwise.
       ceD <- igraph::centr_degree(graphsL[[i]])$centralization#Centralize a graphs according to the degrees of vertices
       ceB <- igraph::centr_betw(graphsL[[i]])$centralization

       graphsMeasures <- c(verte,edge,tran,diam,modl,den,as,ceD,ceB)
       names(graphsMeasures) <- c("vertices","edges","transitivity","diameter","modularityLouvain","edgeDensity","assortativity","centrDegree","centrBetween")
       graphsMeasures <- as.matrix(graphsMeasures)
       colnames(graphsMeasures) <- c("values")

       if(NodesMeasures==TRUE)
       {
       # Node Measures
       d <- igraph::degree(graphsL[[i]])
       tranloc <- igraph::transitivity(graphsL[[i]],type="local")
       bet <- igraph::betweenness(graphsL[[i]])#defined by the number of geodesics (shortest paths) going through a vertex or an edge
       hub <- igraph::hub_score(graphsL[[i]], weights = NULL)$vector#The hub scores of the vertices are defined as the principal eigenvector of A*t(A), where A is the adjacency matrix of the graphs.
       NodeMeasures <- cbind(d,tranloc,bet,hub)
       colnames(NodeMeasures) <- c("degree", "transitivityLocal","betweenness", "hub")

       #  library(ggplot2)
       # HistMeasure <- as.data.frame(NodeMeasures)
       # p <- list()
       # for (j in 1:(dim(HistMeasure)[2]))
       # {
       #     p[[j]] <- ggplot(HistMeasure, aes(x=HistMeasure[,j])) + geom_histogram(color="#e9ecef",fill="#69b3a2")+labs(title=colnames(HistMeasure)[j])
       #     print(j)
       # }
       #
       # print(ggpubr::ggarrange(plotlist=p))
       #
       #

           MeasuresGraphs[[i]] <- list( graphsMeasures=graphsMeasures,
                                    NodeMeasures=NodeMeasures)
       }else{

           MeasuresGraphs[[i]] <- list( graphsMeasures=graphsMeasures)
       }



   }






    return(MeasuresGraphs)
}
