url='C:\Courses\Datasets\Incomplete+Datasets\HOV\Blend20_UD.xlsx';
[data1,str]=xlsread(url);
[r,col] = size(str);
  for qw=1:r
           for er=1:col
               if(strcmp(str(qw,er),'y'))
                   str(qw,er)={1};
               elseif(strcmp(str(qw,er),'n'))
                   str(qw,er)={0};
               elseif(strcmp(str(qw,er),'republican'))
                   str(qw,er)={1};
               elseif(strcmp(str(qw,er),'democrat'))
                   str(qw,er)={0};
               end
           end
  end
   xlswrite(url,str);