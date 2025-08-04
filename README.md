# MATLAB Audio Classifier
A MATLAB project that classifies different classes of sound files. It was developed as a project as part of the course of Sound and Music Computing at the University of Milan

## Overview
This project uses the kNN (k-Nearest Neighbors) which is a classifier which extracts reference vectors from training set and then sets class to majority of k nearest reference vectors. It is used with three different sets of features:
- Frequency features
- Time features
- Frequency and time features altogether

## How it works
In the ```ESC-50/``` folder there are three different of audio classes (from the ESC-50 dataset). I've chosen three of them:
- Wind sounds
- Vacuum cleaner
- Airplane

The reason behind this choice is that I thought these were classes of sounds that could easily be confused with each other. Files are divided by the script: 70% for training the model, 30% for testing.

## Project structure
- ```Project.m``` is the main file
- ```Extract_Features.m``` extracts time and frequency features for each class of sounds
- ```Normalization.m``` brings back every value for every feature in a common scale of values, and it is a very important step for both the PCA and the kNN
- ```Knn_train_fdf.m``` trains and tests kNN using frequency domain features
- ```Knn_train_tdf.m``` trains and tests kNN using time domain features
- ```Knn_train_all.m``` trains and tests kNN using both frequency and time domain features
- ```Functions/``` contains auxiliary functions for feature extraction 

## PCA
PCA stands for Principal Component Analysis and it maps features to new coordinate system by compute covariance matrix R and then
by choosing eigenvectors as axes for the new coordinate system. This task is achieved by using the
MATLAB pca function included in the machine learning toolbox.
- [Before PCA](Assets/before_pca.png)
- [After PCA](Assets/after_pca.png)

## Results
For every set of feature there is a plot that shows kNN recognition rate depending on the number of k-Nearest Neighbors
- [Result plot](Assets/results_plot.png)

## Requirements
This project requires the following MATLAB toolboxes:
- Audio Toolbox
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox
- DSP System Toolbox

