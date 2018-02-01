Location = 'C:\Courses\Datasets\Original+Datasets';
D = dir([Location, '\glass.xlsx']);
filenames = {D(:).name}.';
data = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      data = xlsread(fullname); 
      data1=data;
       [r,col] = size(data);
       for i=1:col
           for j=1:r
               minval=min(data(j,:));
               maxval=max(data(j,:));
               data1(j,i)=(data(j,i)-minval)/(maxval-minval);
           end
       end
       xlswrite(fullname,data1);
end