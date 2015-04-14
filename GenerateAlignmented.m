function [AlignmentedEn,AlignmentedZh] = GenerateAlignmented(a,NumMatrix,en_raw,zh_raw)
    [~,b]=size(NumMatrix);
    AlignmentedEn=cell(a,1);
    AlignmentedZh=cell(a,1);
    k=1;
    for i=1:b
        for j=1:NumMatrix(i)
           AlignmentedEn(k)=en_raw(i);
           AlignmentedZh(k)=zh_raw(i);
           k=k+1;
        end
    end
end

