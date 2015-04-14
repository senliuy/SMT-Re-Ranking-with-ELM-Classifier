load('Label.mat')
load('BLEU_Result_Num.mat');
load('NumMatrix.mat')
[DataNum, number_class]=size(Label);
%Step1: Convert label to number
[~,NumberofTrainingData]=size(Y);
[~,sentenceNum]=size(NumMatrix);
NumberLabel=zeros(1,DataNum);%The Label in number format
TrainLabel=zeros(1,NumberofTrainingData);
for i=1:DataNum
    [~,NumberLabel(i)]=find(Label(i,:)==1);
end
for i=1:NumberofTrainingData
    [~,TrainLabel(i)]=max(Y(:,i));
end
[TrainBLEU,TestBLEU]=calculateBLEU(BLEU_Result_Num,NumMatrix,Y,TY,TrainingSentenceNum)

start=1;
originalTrainingBLEU=0;
for i=1:TrainingSentenceNum
    originalTrainingBLEU=originalTrainingBLEU+BLEU_Result_Num(start);
    start=start+NumMatrix(i);
end
originalTrainingBLEU=originalTrainingBLEU/TrainingSentenceNum

originalTestingBLEU=0;
for i=TrainingSentenceNum+1:sentenceNum
    originalTestingBLEU=originalTestingBLEU+BLEU_Result_Num(start);
    start=start+NumMatrix(i);
end
originalTestingBLEU=originalTestingBLEU/TestingSentenceNum
