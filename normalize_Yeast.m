Location = 'C:\Courses\Datasets\Incomplete+Datasets\Yeast\Med';
D = dir([Location, '\*.xlsx']);
filenames = {D(:).name}.';
data1 = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      [data1,str] = xlsread(fullname);  
      data=data1;
       [r,col] = size(str);
       [r1,col1]=size(data);
       for i=1:r
               if(strcmp(str(i,1),'ME2')==1)
                   data(i,9)=1;
               elseif(strcmp(str(i,1),'ERL')==1)
                   data(i,9)=2;
               elseif(strcmp(str(i,1),'MIT')==1)
                   data(i,9)=3;
               elseif(strcmp(str(i,1),'NUC')==1)
                   data(i,9)=4;
               elseif(strcmp(str(i,1),'ME3')==1)
                   data(i,9)=5;
               elseif(strcmp(str(i,1),'CYT')==1)
                   data(i,9)=6;
               elseif(strcmp(str(i,1),'POX')==1)
                   data(i,9)=7;
               elseif(strcmp(str(i,1),'EXC')==1)
                   data(i,9)=8;
               elseif(strcmp(str(i,1),'VAC')==1)
                   data(i,9)=9;
               elseif(strcmp(str(i,1),'ME1')==1)
                   data(i,9)=10;
               end
       end
       xlswrite(fullname,data);
end
 