# Image-Scene-Classification
#### _Applying transfer learning on the Inception-v3 CNN using the FLICKR image tagging dataset_

This assignment investigates an image classiﬁcation problem for an in-class Kaggle competition. Numerous images must be classiﬁed within 8 categories, which include: 1-structures, 2-indoor, 3people, 4-animals, 5-plant life, 6-food, 7-car, and 8-sea; where the numbers correspond to the classiﬁcation label of each category.

The FLICKR image tagging dataset is used, where the images are 128x128 RGB JPGs. The training set includes 7000 images with training labels provided. The training set’s image distribution within each category is not equal. This assignment required the training of two different image classiﬁers, and test them on two test sets. The ﬁrst test set has 970 images, where the accuracy results are publicly available through Kaggle. The second has 2000 images, with hidden accuracy results until submission to discourage hyperparameter tuning. Results are compared to a baseline classiﬁer with an accuracy of 44.22% on the public test set.

An implementation for SVM and kNN were also tested against each other, however the Inception model outperformed them all. The final Inception model's hyperparameter set used, obtained a puclic test set accuracy of 80.72%, and 78.95% on the private test set.

Dataset Discription:
* `public_test.tar.gz`
  * Contains 970 public test images
* `train.csv`
  * Contains training labels for each image in training set
* `train.tar.gz`
  * Contains 7000 images for training 

Tausif S., 2016
