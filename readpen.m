function ds=readpen(raw)
% input
% raw: string, txt file name
% ouput
% ds.char: column vector of characaters
% ds.path: array of dots
%
% reads online handwriting raw data from txt file raw
% data from UCI Machine Learning Repository, Pen-Based Recognition of
% Handwritten Digits Data Set
%
% txt file data format
% each digit start with
% '.SEGMENT ' string # '?' char
% '.COMMENT ' string char # #
% each pen stroke start with '.PEN_DOWN', ends with '.PEN_UP' followed by
% '.DT 100'
% no end signal
%
% output data format
% dataset

ds=dataset('File',raw,'Delimiter','\t','ReadVarNames',false);
ds(cellfun(@isempty,regexp(ds.Var1,'\d \d|SEGMENT|PEN')),:)=[];
ds=ds.Var1;

ds=strcat(ds,' 0');
index=find(strncmp(ds,'.PEN_DOWN',9));
ds(index)=strcat(ds(index+1),'1');
index=find(strncmp(ds,'.PEN_UP',7));
ds(index)=strcat(ds(index-1),'1');

char=cellfun(@(x)textscan(x,'.SEGMENT %*s %*s %*s "%c'),ds);
index=find(cellfun(@(x)not(isempty(x)),char));
index=mat2cell([index+1,[index(2:end)-1;length(char)]],ones(length(index),1));
char=cell2mat(char);
ds=cellfun(@(x)textscan(x,'%f'),ds);
path=cellfun(@(x)horzcat(ds{x(1):x(2)}),index,'UniformOutput',false);

ds=dataset(char,path);

end