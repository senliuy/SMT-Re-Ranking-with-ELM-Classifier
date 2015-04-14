function [TrainingBLEU,TesingtBLEU] = calculateBLEU(BLEU_Result_Num,NumMatrix,C,D,TrainingSentenceNum)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    A=cat(2,C,D);
    [~,NumberofA]=size(A);
    [~,SentenceNum]=size(NumMatrix);
    for i=1:NumberofA
        [~,TrainLabel(i)]=max(A(:,i));
    end
    SegmentVector=zeros(1,SentenceNum);%保存训练数据集的Segment
    startPosition=1;
    for i=1:SentenceNum
        bestLength=NumMatrix(i);
        endPosition=startPosition+bestLength-1;
        ProcessingMatrix=TrainLabel(1,startPosition:endPosition);
        [~,Index]=min(ProcessingMatrix);
        SegmentVector(i)=Index+startPosition-1;
        startPosition=endPosition+1;
    end
    TrainBLEU=0;
    TestBLEU=0;
    for i=1:TrainingSentenceNum
        TrainBLEU=TrainBLEU+BLEU_Result_Num(SegmentVector(i));
    end
    TrainingBLEU=(TrainBLEU/TrainingSentenceNum);
    for i=TrainingSentenceNum+1:SentenceNum
        TestBLEU=TestBLEU+BLEU_Result_Num(SegmentVector(i));
    end
    TesingtBLEU=TestBLEU/(SentenceNum-TrainingSentenceNum);
    save calculateBLEU
end


