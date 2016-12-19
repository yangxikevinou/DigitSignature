# DigitSignature
MATH820 F16 Project: Signature and Handwriting Digit Recognition  

Copyright: Kevin OU @ CMU, 2016\to\infty  
Terms and conditions: For MATH820 F16 Sharing ONLY


As a proof of concepts, the goal of the project is to recognize online handwriting digits using signature as extracted features and linear functionals as classifiers. The idea is to apply analysis techniques (linear functionals) in a good space (algebra of formal tensor series) with bad objects (signatures) rather than in a bad space (monoid of path space) with good objects(paths, or 1-currents), (Antoine's comment), in contrast to machine learning approach where objects are simple but algorithms are convoluted.  


This folder contains the final report and the MATLAB implementation of the course project of MATH820 in Fall 2016 at CMU.  

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
fix the upside-down problem in the raw data.  
contains upper and lower case Roman characters in addition to digits.  


digit_tra.mat  
two-column dataset imported from 'pendigits-orig-tra.txt'. the training set.  


digit_tes.mat  
two-column dataset imported from 'pendigits-orig-tes.txt'. the test set.  


npath.m  
input:  
output:  


sig.m  
input:  
output:  


recog.m  


FS_2d.mat  


FS_2d.fig  


writedigit.m  
input:  
output:  


demo.m  


test.m, work.m  
used to test codes (more like a personal memo or clipboard), not meaningful, and guaranteed with glitches if not properly run. provided as examples of applying the functions and performing analyses (along with an opportunity to mock the author's coding habits).
