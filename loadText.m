function [ raw ] = loadText(filename)
    %This function used to convert .txt file to .mat file
    %Author: senliuy@gmail.com
    %Date:2015-4-11
    fid=fopen(filename);
    raw=cell(1,1);
    i=1;
    while 1
        tline=fgetl(fid);
        if ~ ischar(tline)
            break;
        end
        raw{i,1}=tline;
        i=i+1;
    end
    fclose(fid);
end