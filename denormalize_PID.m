Location = 'C:\Courses\Datasets\Imputed\glass\Comp';
D = dir([Location, '\*.xlsx']);
filenames = {D(:).name}.';
data = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      data = xlsread(fullname);
      smdata=xlsread('C:\Courses\Datasets\Original+Datasets\glass.xlsx');
      [r,col] = size(data);
      for i=1:col
           for j=1:r
               minval=min(smdata(j,:));
               maxval=max(smdata(j,:));
               data1(j,i)=minval+data(j,i)*(maxval-minval);
           end
      end
       xlswrite(fullname,data1);
end