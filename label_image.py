"""
Image Scene Classifier Project.

This script labels all test image using
the existing trained graph files.

Tausif S., 2016
"""

import numpy as np
import os
import tensorflow as tf
import sys

# Array to store prediction results with size of test set.
num_files = len(os.listdir("test_set/"))
prediction_results = np.zeros((num_files, 2))


# Loading existing label file and strips off carriage return.
label_lines = [line.rstrip() for line 
                    in tf.gfile.GFile("retrained_labels.txt")]

# Getting existing retrined graph from file.
with tf.gfile.FastGFile("retrained_graph.pb", 'rb') as f:
    graph_def = tf.GraphDef()
    graph_def.ParseFromString(f.read())
    _ = tf.import_graph_def(graph_def, name='')

# Looping through all images and predicting each.
for i in range(1, num_files + 1):
    # Arraging image file name depending on current image.
    if(i < 10):
        imgPre = "0000"
    elif((i >= 10) and (i < 100)):
        imgPre = "000"
    elif((i >= 100) and (i < 1000)):
        imgPre = "00"
    elif(i >= 1000):
        imgPre = "0"

    # Declaring image path.
    image_path = "test_set/" + str(imgPre) + str(i) + ".jpg"

    # Reading and storing the image data.
    image_data = tf.gfile.FastGFile(image_path, 'rb').read()

    # Starting tf session for prediction
    with tf.Session() as sess:
        # Feeding image data as input to graph and for prediction.
        softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
        
        # Running actual prediction.
        predictions = sess.run(softmax_tensor, \
                 {'DecodeJpeg/contents:0': image_data})
        
        # Sorting predictions in order of confidence.
        sort_conf = predictions[0].argsort()[-len(predictions[0]):][::-1]

        # Printing current image prediction on 
        predicted_label = label_lines[sort_conf[0]]
        score = predictions[0][sort_conf[0]]
        print("IMG %s: %s (score = %.5f)" % (i, predicted_label, score))

        # Adding results to the array for future saving.
        prediction_results[i - 1, :] = [i, sort_conf[0] + 1]
        
    # Ending current session.
    sess.close()

# Saving results as .csv for Kaggle submission.
np.savetxt("test.csv", prediction_results, delimiter = ",", header = "Id,Label")
