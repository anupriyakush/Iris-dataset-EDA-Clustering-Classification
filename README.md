# Iris-dataset-EDA-Clustering-Classification

Project done under Prof. Yan yu.

EDA:

Data Definition
Iris dataset has 150 rows and 5 columns. The class of all the quantitative columns is ‘numeric’ hence we don’t need to do any modification in the class type to plot histograms. There is no null/NA values in any of the columns. There are three different types on species. 

Summary Statistics:

Each species has 50 values. For petal length and petal width, median is greater than mean which means the data is skewed to the left. In other cases, the mean is greater than the median by a very small difference. Hence, even though this is right skewed, we can ignore the skewness. We can assume that the distribution is almost normal. for skewed distributions, the standard deviation gives no information on the asymmetry. It is better to use the first and third quartiles, since these will give some sense of the asymmetry of the distribution.
Petal length has considerably higher standard deviation as compared to others. Mean of sepal length for virginica is the highest while it’s lowest for setosa. Mean of sepal width for setosa is the highest and lowest for versicolor. Petal length of Virginica is the highest and setosa’s mean petal width is considerably low. Virginica has the highest petal width and setosa has the lowest. 
Virginica has the highest standard deviation for all the columns. 

Density plot:

Setosa has the smallest Sepal length while virginica has the highest.  Setosa has largest sepal width and versicolor has the lowest.  Setosa has smallest petal length and width as well. Hence, setosa is quite different that the other two species. 
For petal length and width, Setosa has no overlap with the other species and the density is narrow (very small variance). Versicolor and virginica have less overlap than with sepal length & width and can be separated quite well.
Sepal length and width suggest a likelihood of normal distribution. Petal length and width have characteristics of bimodal distribution. 

Scatter plot:

Petal width and petal length are highly correlated. Surprisingly sepal length and sepal width are not at all positively correlated.  There is a very high correlation between sepal length-petal width and sepal length-petal length. 

Histogram:
Sepal width is normally distributed. Similar pattern can be seen in Sepal length.  Petal length and petal width seem to diverge from the normal distribution.

K means clustering:

So far, we have seen that there is a difference among petal lengths for the different species of iris flowers. Hence, Petal Length is a good way to tell the flowers apart. But Petals are only visible after a flower has already blossomed. If we want to predict the flower type beforehand, we will examine whether the sepal factors are correlated to petal length. As we have already seen, there is a very high correlation between sepal length-petal width and sepal length-petal length.
I plotted k means clusters using 3,4,5 and 10 as k values. At first look, 3,4,5 seem a good fit but we need to find the optimal k value. 
WSS (Within cluster sum of square) increases when the value of k increases. We should choose a value of ‘k’ that minimizes WSS. But without proper algorithms, we cannot be sure which value to take because WSS will always be lowest i.e. 0 for k=1. Hence, we used elbow method and Silhouette method to find the perfect k. 
Hence, we will use elbow method to find the best fit. The idea behind k-means clustering is to define clusters such that the total intra-cluster variation [or total within-cluster sum of square (WSS)] is minimized.We should choose the number of clusters so that adding another cluster doesn’t improve much better the total WSS. Looking at the graph, I found 3 to be the perfect fit. 
For k=3, my findings were:

•	Size of each cluster is 38, 50 ,62. 
•	WSS of each cluster is 23.87, 15.15, 39.82 respectively. 
•	According to the plots, cluster of Setosa is independent of other two clusters. 

KNN:

Trained the model on random sample of 80% data and tested on remaining 20%. Optimal value of KNN is 9 because that results in the highest accuracy of 96.6%. After 9, accuracy starts to decline. 
