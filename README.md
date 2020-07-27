# Spatiotemporal-SOM
## Description
The self-organizing map (SOM) is a neural network-based classification method with unsupervised learning (Kohonen, 1982). The excellent clustering ability of SOM is valuable because of its noise tolerance and nonlinearity characteristics. This repository provides several Matlab script files that utilize the SOM algorithm for spatiotemporal analysis. 

The spatiotemporal SOM analysis is applied to explore the spatiotemporal variability in water quality in Hong Kong marine water areas. SOMs are applied at both spatial and temporal domains for the multivariate marine water quality observations, and principal component analysis (PCA) is used to cluster SOM neurons and component planes. The analysing results demonstrate that applying a SOM at a spatial domain allowed us to obtain spatial clusters of monitoring stations and to investigate relationships among the parameters, while applying a SOM at a temporal domain allowed us to obtain temporal variability in observational time series. Overall, the combined use of SOM and PCA provides a holistic view of the complex multivariate water quality data.
   
Spatiotemporal-SOM is developed by a candidate Ph.D. student Jiang Yu at [College of Engineering](http://en.coe.pku.edu.cn/), [Peking University](http://english.pku.edu.cn/). The SOM Toolbox 2.0 developed by Vatanen et al. is employed to provide the SOM algorithm.

## References
Vatanen, T., Osmala, M., Raiko, T., Lagus, K., Sysi-Aho, M., Orešič, M., Honkela, T. and Lähdesmäki, H. (2015). Self-organization and missing values in SOM and GTM. Neurocomputing, 147, 60–70. https://doi.org/10.1016/j.neucom.2014.02.061

Vesanto, J., Himberg, J., Alhoniemi, E. & Parhankangas, J. (2000). Self-organizing map in Matlab: The SOM Toolbox. Proceedings of the Proceedings of the Matlab DSP Conference, 99.

## Major Libraries
Third-party libraries used in this repository:
* [SOM Toolbox 2.0](http://www.cis.hut.fi/projects/somtoolbox/)

## Acknowledgements
The Spatiotemporal-SOM is supported by the National Natural Science Foundation of China (No. 41890852).

## COPYRIGHT
This software is free; you can redistribute it and/or modify it under the terms of the MIT License.

Note: The software contains contributed files, which may have their own copyright notices. If not, the MIT holds for them, too, but so that the author(s) of the file have the Copyright.

This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT License for more details.

## LICENSING THE LIBRARY FOR PROPRIETARY PROGRAMS
As stated in the MIT License (see the license in COPYING) it is not possible to include this software library in a commercial proprietary program without written permission from the owners of the copyright.
