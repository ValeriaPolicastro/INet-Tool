# *INet* for Network Integration

<img src="https://github.com/ValeriaPolicastro/Images/blob/master/images/INetTool_Logo.png" align="right" width="150" height="160"/> The method is described in detail in the paper:

*V. Policastro, M. Magnani, C. Angelini and A. Carissimo(2024). INet for network integration. Computational Statistics.* <https://link.springer.com/article/10.1007/s00180-024-01536-8>

Available on CRAN <https://CRAN.R-project.org/package=INetTool>

For the installation in R:

```         
  install.packages("INetTool")
```

For the installation from github:

```         
           devtools::install_github("ValeriaPolicastro/INet-Tool")
```

We want to identify general information by building a **Consensus Network** and then to obtain **Case-Specific Networks** one for each layer with the information present only in that layer and not in all the others.

<p align="center">

<img src="https://github.com/ValeriaPolicastro/Images/blob/master/images/Idea2.png" width="480" height="145"/>

</p>

*Important Functions:*

-   **consensusNet** to create the *Consensus Network*

-   **specificNet** to create the *Case Specific Network*

-   **thresholdNet** to change the threshold of the consensus from the similar layer after the algorithm

-   **JWmean** to see how distant are the layers at the beginning

*Integration Network Algorithm:*

<p align="center">

<img src="https://github.com/ValeriaPolicastro/Images/blob/master/images/INetAlgorithm.png" width="600" height="300"/>

</p>

### Interactive Network Explorer

Explore the results of network integration with **INetTool** through an interactive visualization of consensus and case-specific networks derived from viral infections and vaccination transcriptomic data.

The dashboard includes 11 weighted gene networks, covering HIV, influenza, dengue, and their vaccination-associated responses.

Users can interactively explore gene connectivity, inspect edge weights, identify central genes using degree, betweenness, closeness, and harmonic centrality, and filter network visualizations.

**[Explore the Interactive Network Dashboard](https://valeriapolicastro.github.io/INet-Tool/)**
