%This script is used to extract features and sentences from the original n-best files
%Author: senliuy@gmail.com
%Data:2015-4-08
clear;clc;
%!important
        %if n-best file is stored as .mat format file do:
load('listfile.mat');
load('OriginalEn.mat');
load('OriginalZh.mat');
        %if n-best file is stored as text format do:
% raw=loadText('Data1/n-best');
% en_raw=loadText('Data1/en');
% zh_raw=loadText('Data1/fr');
[a,~]=size(raw); %a is the lines of listfile
%Extract Sentence,Features,and the number of each original sentence's n-best lists
[SentenceMatrix,FeatureMatrix,NumMatrix]=ExtractFeature(a,raw);
clear raw;
%Generate Alignmented files
[AlignmentedEn,AlignmentedZh]=GenerateAlignmented(a,NumMatrix,en_raw,zh_raw);
clear zh_raw;clear en_raw;
save NumMatrix NumMatrix;
save FeatureMatrix FeatureMatrix;
%Generate text file to calculate BLEU values
toText(SentenceMatrix,AlignmentedEn);