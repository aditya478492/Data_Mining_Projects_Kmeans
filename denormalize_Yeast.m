Location = 'C:\Courses\Datasets\Imputed\Yeast';
D = dir([Location, '\*.xlsx']);
filenames = {D(:).name}.';
data = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      [data,str] = xlsread(fullname);  
      data1=[data,str];
       [r,col] = size(data);
       for i=1:r
           for j=1:col-1
         if(data(i,9)==1)
             str(i,9)=cellstr('ME2');
         elseif(data(i,9)==2)
             str(i,9)=cellstr('ERL');
         elseif(data(i,9)==3)
             str(i,9)=cellstr('MIT');
         elseif(data(i,9)==4)
             str(i,9)=cellstr('NUC');
         elseif(data(i,9)==5)
             str(i,9)=cellstr('ME3');
         elseif(data(i,9)==6)
             str(i,9)=cellstr('CYT');
         elseif(data(i,9)==7)
             str(i,9)=cellstr('POX');
         elseif(data(i,9)==8)
             str(i,9)=cellstr('EXC');
         elseif(data(i,9)==9)
             str(i,9)=cellstr('VAC');
         elseif(data(i,9)==10)
             str(i,9)=cellstr('ME1');
         end
         str(i,j)={data(i,j)};
           end
       end
       xlswrite(fullname,str);
end