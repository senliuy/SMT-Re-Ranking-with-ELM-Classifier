function [SentenceMatrix,FeatureMatrix,NumMatrix]=ExtractFeature(a,raw)
%Author:senliuy@gmail.com
%Data: 2015-04-09
%Description: This function used to extract sentence, features and the
%number of n-best list file which is used after.
    SentenceMatrix=raw; %Matrix that include all the sentence
    FeatureMatrix=zeros(a,15); %Matrix that include all the features
    SentenceNum=zeros(a,1); %Matrix that include all the sentence numbers
    for i=1:a
        p=raw(i,1);
        p=p{1};
        Lex=strfind(p,'LexicalReordering0');
        Space=strfind(p,' ');
        %找出特征部分的第一个空格
        [~,d]=size(Space);
        for j=1:d
            if Space(j)>Lex
                PositionOfFirstFeatureMatrixSpace=j;
                break;
            end
        end
        %Extract Fature
        %Extract Lexical Reordering
        Lex1=p(Space(PositionOfFirstFeatureMatrixSpace):Space(PositionOfFirstFeatureMatrixSpace+1));
        Lex2=p(Space(PositionOfFirstFeatureMatrixSpace+1):Space(PositionOfFirstFeatureMatrixSpace+2));
        Lex3=p(Space(PositionOfFirstFeatureMatrixSpace+2):Space(PositionOfFirstFeatureMatrixSpace+3));
        Lex4=p(Space(PositionOfFirstFeatureMatrixSpace+3):Space(PositionOfFirstFeatureMatrixSpace+4));
        Lex5=p(Space(PositionOfFirstFeatureMatrixSpace+4):Space(PositionOfFirstFeatureMatrixSpace+5));
        Lex6=p(Space(PositionOfFirstFeatureMatrixSpace+5):Space(PositionOfFirstFeatureMatrixSpace+6));
        FeatureMatrix(i,1)=str2double(Lex1);
        FeatureMatrix(i,2)=str2double(Lex2);
        FeatureMatrix(i,3)=str2double(Lex3);
        FeatureMatrix(i,4)=str2double(Lex4);
        FeatureMatrix(i,5)=str2double(Lex5);
        FeatureMatrix(i,6)=str2double(Lex6);
        %Extract Dustortation
        Distortation=p(Space(PositionOfFirstFeatureMatrixSpace+7):Space(PositionOfFirstFeatureMatrixSpace+8));
        FeatureMatrix(i,7)=str2double(Distortation);
        %Extract Language Model
        LM=p(Space(PositionOfFirstFeatureMatrixSpace+9):Space(PositionOfFirstFeatureMatrixSpace+10));
        FeatureMatrix(i,8)=str2double(LM);
        %Extract Word Penalty
        WordPenalty=p(Space(PositionOfFirstFeatureMatrixSpace+11):Space(PositionOfFirstFeatureMatrixSpace+12));
        FeatureMatrix(i,9)=str2double(WordPenalty);
        %Extract Phrase Penalty
        PhrasePenalty=p(Space(PositionOfFirstFeatureMatrixSpace+13):Space(PositionOfFirstFeatureMatrixSpace+14));
        FeatureMatrix(i,10)=str2double(PhrasePenalty);
        %Extract Translation Model
        TranslationModel1=p(Space(PositionOfFirstFeatureMatrixSpace+15):Space(PositionOfFirstFeatureMatrixSpace+16));
        TranslationModel2=p(Space(PositionOfFirstFeatureMatrixSpace+16):Space(PositionOfFirstFeatureMatrixSpace+17));
        TranslationModel3=p(Space(PositionOfFirstFeatureMatrixSpace+17):Space(PositionOfFirstFeatureMatrixSpace+18));
        TranslationModel4=p(Space(PositionOfFirstFeatureMatrixSpace+18):Space(PositionOfFirstFeatureMatrixSpace+19));
        FeatureMatrix(i,11)=str2double(TranslationModel1);
        FeatureMatrix(i,12)=str2double(TranslationModel2);
        FeatureMatrix(i,13)=str2double(TranslationModel3);
        FeatureMatrix(i,14)=str2double(TranslationModel4);
        %Extract System Score
        Score=p(Space(PositionOfFirstFeatureMatrixSpace+20):length(p));
        FeatureMatrix(i,15)=str2double(Score);

        %Extract Sentence
        SentenceMatrix{i}=p(Space(2):Space(PositionOfFirstFeatureMatrixSpace-2));

        %Extract Number
        SentenceNum(i)=str2double(p(1:Space(1)));
    end
    CorpusNum=max(SentenceNum);%the n of n-best file
    NumMatrix=zeros(1,CorpusNum+1);
    for i=1:a
        NumMatrix(1,SentenceNum(i)+1)=NumMatrix(1,SentenceNum(i)+1)+1;
    end
end

