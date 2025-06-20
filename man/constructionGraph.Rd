% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConstructionGraph.R
\name{constructionGraph}
\alias{constructionGraph}
\title{constructionGraph}
\usage{
constructionGraph(data, perc = 0.95)
}
\arguments{
\item{data}{a list of datasets}

\item{perc}{percentile (default 0.95 it takes the 5 percent of the highest
weights)}
}
\value{
Threshold information (highest weight, number of edges, number of nodes,
modularity with louvain method), graphs in a list for each layer and weighted
adjacency matrices in a list for each layer.
}
\description{
This function constructs graphs from data with pearson correlation and
proportional thresholding (the data should be with the same names (the nodes)
in columns for all the matrices).
}
\examples{
data("exampleL_data")
constructionGraph(exampleL_data)
}
