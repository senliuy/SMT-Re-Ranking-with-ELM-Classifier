function [] = toText(SentenceMatrix,AlignmentedEn)
%This file used to divide generate txt file than use MOSES to calculate BLEU
%Author: senliuy@gmail.com
%Date:2015-04-11
    if (exist('SentenceMatrix.txt')~=0)
        delete('SentenceMatrix.txt');
    end
    if (exist('AlignmentedEn.txt')~=0)
        delete('AlignmentedEn.txt');
    end
    [a,~]=size(SentenceMatrix);
    SenFile='SentenceMatrix.txt';
    EnFile='AlignmentedEn.txt';
    SenFid=fopen(SenFile,'a+');
    for j=1:a
        if j==a
            senStr=[SentenceMatrix{j}];
        else
            senStr=[SentenceMatrix{j},'\n'];
        end
        fprintf(SenFid,senStr);
    end  
    fclose(SenFid);
    EnFid=fopen(EnFile,'a+');
    for j=1:a
        if j==a
            senStr=[AlignmentedEn{j}];
        else
            senStr=[AlignmentedEn{j},'\n'];
        end
        fprintf(EnFid,senStr);
    end  
    fclose(EnFid);
end