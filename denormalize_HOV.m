Location = 'C:\Courses\Datasets\Imputed\HOV';
D = dir([Location, '\*.xlsx']);
filenames = {D(:).name}.';
data = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      [data,str] = xlsread(fullname);
      [r,col]=size(data);
      p='republican';
      d='democrat';
      n='n';
      y='y';
      for i=1:r
          for j=1:col-1
              
              if(data(i,j)==0)
                  str(i,j)=cellstr(n);
              elseif(data(i,j)==1)
                  str(i,j)=cellstr(y);
              end
          end
      end
      for i=1:r
          if(data(i,17)==1)
              str(i,17)=cellstr(p);
          elseif(data(i,17)==0)
              str(i,17)=cellstr(d);
          end
      end
     
      xlswrite(fullname,str);
end