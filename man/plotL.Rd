% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plots.R
\name{plotL}
\alias{plotL}
\title{plotL}
\usage{
plotL(graphL, ...)
}
\arguments{
\item{graphL}{List of graphs}

\item{...}{other parameter}
}
\value{
plot of graphs
}
\description{
This function plots all the layers in one plot(wrapper of
plot.multinet).
}
\examples{
data("graphL_data")
plotL(graphL_data)
}
