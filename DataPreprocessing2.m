%Convert Digitial BLEU Result to Label
clc;clear;
load('NumMatrix.mat');
fileformat='mat'; %Select mat or text
[~,SentenceNum]=size(NumMatrix);
%load BLEU value from .mat file
if strcmp(fileformat,'mat')
    load('BLEU_Result_Num.mat');
    [BLEUNum,~]=size(BLEU_Result_Num);
else strcmp(fileformat,'text')
    %load BLEU value from original text, very time consuming
    BLEU_Result=loadText('BLEU_Result');
    [BLEUNum,~]=size(BLEU_Result);
    BLEU_Result_Num=zeros(BLEUNum,1);
    for i=1:BLEUNum
        BLEU_Result_Num(i)=vpa(str2double(BLEU_Result{i}),4);
    end
end
LabelResult=zeros(BLEUNum,1);
classNumbers=10;%The number of classes you want to divide
BLEUIndex=1;
for i=1:SentenceNum
    %the BLEU scope of the ith sentence
    startSegment=BLEUIndex;%First Segment of the ith sentence
    length=NumMatrix(i);%Number of best list
    endSegment=length+startSegment-1;%The last Segment of ith sentence
    BLEUScope=BLEU_Result_Num(startSegment:endSegment,1);
    SortedBLEUScope=sort(BLEUScope,'ascend');%Sort the bLEU of each sentence
    classLength=ceil(length/classNumbers);%The length of each class
    for j=1:length
        LabelResult(BLEUIndex+j-1)=ceil(10-min(find(SortedBLEUScope==BLEU_Result_Num(BLEUIndex+j-1)))/classNumbers);
    end
    BLEUIndex=BLEUIndex+length;
end
Label=zeros(BLEUNum,classNumbers);
for i=1:BLEUNum
    if LabelResult(i,1)==0
        LabelResult(i,1)=1;
    end
    Label(i,LabelResult(i,1))=1;
end
Label=2*Label-1;
save Label Label;