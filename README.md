# K-Nearest Neighbor Classifier
K-Nearest Neighbors is a non-parametric, supervised machine learning algorithm in which the entire training dataset is stored and when a prediction is required, the k-most similar records to a new record from the training dataset are then located. From these neighbors, a summarized prediction is made. Once the neighbors are discovered, the summary pre- diction can be made by returning the most common outcome or taking the average. The KNN can be used for classification or regression problems.In this chapter, it summarizes the method in which KNN classifier was build using MATLAB using the MNIST digits dataset.
## Result
After testing the model, it was observed that the error of the model varied with every digits.The error varied for dierent values of k. The digits like 1 and 7, 0 and 8 were more likely to be mis-classified when compared to digits like 2 and 6,3 and 5 etc. The Figure shows the error and accuracy histograms for various digits for different values of k.
(NOTE:In the plot digit 10 corresponds to digit 0.)
## Installation and Running Procedure
This program requires a working MATLAB installation.
To run this program clone this repository into your workspace
```
git clone https://github.com/NithaElizabeth/kNNClassifier
```
## Author
The system was developed by Nitha Elizabeth John as a part of academic curriculam of EMARO.\
Author  : Nitha Elizabeth John\
Contact : nithaelizabethjohn@gmail.com
