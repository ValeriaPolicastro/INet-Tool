# INet Tool <img src="https://github.com/ValeriaPolicastro/Paper-Robin/blob/master/images/logoINet.png" align="right" width="150" height="150"/>

For the installation in R:

               devtools::install_github("ValeriaPolicastro/INet-Tool")


*Note: if the package ‘datastructure’ is not available for your version of R use devtools::install_github("dirmeier/datastructures") before installing INet*

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

<img src="https://github.com/ValeriaPolicastro/Images/blob/master/images/Algorithm2.png" width="600" height="300"/>

</p>


## License
[Copyright (c) 2022 V. Policastro](https://github.com/ValeriaPolicastro/INet-package/blob/main/LICENSE)



