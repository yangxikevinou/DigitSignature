# DigitSignature
MATH820 F16 Project: Signature and Handwriting Digit Recognition  

Copyright: Kevin OU @ CMU, 2016\to\infty  
Terms and conditions: For MATH820 F16 Sharing ONLY


As a proof of concepts, the goal of the project is to recognize online handwriting digits using signature as extracted features and linear functionals as classifiers. The idea is to apply analysis techniques (linear functionals) in a good space (algebra of formal tensor series) with bad objects (signatures) rather than in a bad space (monoid of path space) with good objects(paths, or 1-currents), (Antoine's comment), in contrast to machine learning approach where objects are simple but algorithms are convoluted.  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  


This folder contains the final report and the MATLAB implementation of the course project of MATH820 in Fall 2016 at CMU.  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  

TODO  
to do list, as the name suggested  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  

The folder Report contains the .tex and .bib source files and the .pdf output file of the report.  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  

The folder DataSource contains the unzipped raw data used in the study.  
All data are taken from University of California, Irvine (UCI) Machine Learning Repository.  
Pleae refer to the corresponding webpage for a complete discription of data.  

http://archive.ics.uci.edu/ml/datasets/Pen-Based+Recognition+of+Handwritten+Digits  
This is a data set of online handwriting digits, taken from 44 writers with 250 samples each. The training and test set have been divided, with the training set almost twice as large as the test one.  
The files are unzipped and changed to .txt  
Training set: pendigits-orig-tra.txt  
Testing set: pendigits-orig-tes.txt  

http://archive.ics.uci.edu/ml/datasets/UJI+Pen+Characters  
This is the first version of data of online handwriting characters and digits, containing upper and lower case Roman characters and digits from 11 writers, with each symbol occurring twice per writer. One file corresponds to one writer. Note that the y-axis is upside down, i.e. the coordinate decreases as the stylus moves up on the panel.  
The files are unzipped and changed to .txt  
Writer i: 'UJIpenchars-w' & i & '.txt', where i is from 01 to 11 (in 2-digit).  

There is also a second version not used in the study and not included here.  
http://archive.ics.uci.edu/ml/datasets/UJI+Pen+Characters+(Version+2)  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  

All codes are tested in MATLAB R2016a. Statistical and Machine Learningn Toolbox (along with its dependencies) are required. With the exception of "demo.m" and "writedigit.m", which deploys "animated line" object, all codes are orignally written and tested in MATLAB R2009a. Some data types e.g. "dataset" and functions e.g. "classify" may be obsolete and possibly removed from future MATLAB releases, though (better) substitute is available. Please refer to MATLAB support for details.  

If MATLAB version or toolbox or system performance is an issue, you may run MATLAB R2016a with the required toolbox(es) on Virtual Andrew or in the Wean Hall 5th computer lab. (Thanks Antoine for letting me know.)  

Please contact the author if you experience bugs or diffulties in using the following MATLAB codes and data (or simply don't want to go through the lines).  

%%%%%%%%%%%%%%%%%%%%%%%%%%%  

readpen.m  
input: file name  
output: dataset  
automated code to import raw data in UJI pendigit format from .txt to dataset data type in MATLAB. encodes "PEN_DOWN" and "PEN_UP" signal in the third dimension by binary indicator with redundancy.  
no need to run unless starting from scratch with new raw data in the same format.  
implementation was suboptimal especially for large files as I was obssessed in avoiding loops in MATLAB. recommend divide-and-conquer when importing large files.  


char_ds.mat  
concatenated two-column dataset imported from eleven 'UJIpenchars-w' & i & '.txt', i=1:11, writer name excluded.  
first column .char, second column .path  
fix the upside-down problem in the raw data.  
contains upper and lower case Roman characters in addition to digits.  


digit_tra.mat  
two-column dataset imported from 'pendigits-orig-tra.txt'. the training set.  
first column .char, second column .path  


digit_tes.mat  
two-column dataset imported from 'pendigits-orig-tes.txt'. the test set.  
first column .char, second column .path  


npath.m  
input: (d-1)-dim path, the d-th dimension indicates jumps, normalized length  
output: normalized (d-1)-dim path, the d-th dimension indicates jumps  
general function normalizes the continuous part of a (d-1)-dim path to a fixed length, with the d-th dimension indicating jumps preserved.  
the most intuitive and basic preprocessing of online handwriting data and other data analyses in which the lengths should be ignored.  


sig.m  
input: path, tensor power  
output: signature of path truncated at the tensor power  
general function inductively (on degrees) computes the truncated signature, keeping the trivial zeroth term 1.  
exploits vectorization power of MATLAB, but it could be memory intensive for HIGH dimensional array.  
in case of memory outflow, try divide-and-conquer by breaking long paths into short ones, or modify the function to store temporary large arrays in file (hard drive) using MATLAB built-in file IOs.  


recog.m  
code snippet directly adapted from MATLAB R2009a help file "Selecting Features for Classifying High-dimensional Data". (R2016a help file is different due to substitution of obsolete functions in R2009a, but it is backward compatible.)  
good to know which tensor is leading in predictive/discriminative power, but of minimal value since tensors are computed inductively and we need lower order tensors to compute higher order ones.  
instead of optimizing via feature selection, one should consider optimization by preprocessing and/or postprocessing (pre and post are relative to the computation of signatures).  


FS_2d.mat  
saved workspace of output variables of "recog.m", with original dataset and signature matrix deleted as they are huge and can be loaded or computed immediately. (signature matrix of digit_tra.mat is 110MB!)  
please refer to "recog.m" for documentation of variables and usage.  


FS_2d.fig  
output plot of "recog.m" showing the decays of errors in sequential feature selections, with red for resubstition dataset (flawed method) and blue for 10-fold holdout dataset (correct method)  


writedigit.m  
input: ordered pixels of handwriting, third dimension indicates jumps, optional input for time between adjacent sample points  
output: movie struct  
writes the handwriting data in animation, points at which the pen puts down/up are respectively labelled with green/red downward/upward pointing triangles.  
outputs a movie struct for playback with "movie" function.  
could be used with "movie2gif" (free online available for download from MATLAB central) to create .gif (or write your own conversion with built-in "imwrite").  
uses "animated line" object unavailable in R2009a or older version.  

demo.m  
line-by-line code for project presentation, including signature computation, data visualization, and naive classification  
can be viewed as examples of applying the functions and performing analyses.  
