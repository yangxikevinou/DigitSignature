# DigitSignature
MATH820 F16 Project: Signature and Handwriting Digit Recognition

As a proof of concepts, the goal of the project is to recognize online handwriting digits using signature as extracted features and linear functionals as classifiers. The idea is to apply analysis techniques (linear functionals) in a good space (algebra of formal tensor series) with bad objects (signatures) rather than in a bad space (monoid of path space) with good objects(paths, or 1-currents), (Antoine's comment), in contrast to machine learning approach where objects are simple but algorithms are convoluted.


This folder contains the final report and the MATLAB implementation of the course project of MATH820 in Fall 2016 at CMU.


The folder DataSource contains the unzipped raw data used in the study taken from UCI Machine Learning Repository.


All codes are tested in MATLAB R2016a. Statistical and Machine Learningn Toolbox (along with its dependencies) are required. With the exception of writedigit.m, which uses "animated line" object, all codes are orignally written and tested in MATLAB R2009a. Some data types e.g. "dataset" and functions e.g. "classify" may be obsolete and possibly removed from future MATLAB releases, though (better) substitute is available. Please refer to MATLAB support for details.


readpen.m
input: file name
output: dataset
automated code to import raw data in UJI pendigit format from .txt to dataset data type in MATLAB. encodes "PEN_DOWN" and "PEN_UP" signal in the third dimension by binary indicator with redundancy.
no need to run unless starting from scratch with new raw data in the same format.
implementation was suboptimal especially for large files as I was obssessed in avoiding loops in MATLAB. recommend divide-and-conquer when importing large files.


char_ds.mat
concatenated two-column dataset imported from eleven 'UJIpenchars-w' & i & '.txt', i=1:11, writer name excluded.
fix the upside-down problem in the raw data.
contains upper and lower case Roman characters in addition to digits.

digit_tra.mat

digit_tes.mat
