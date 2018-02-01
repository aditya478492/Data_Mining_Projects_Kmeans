Location = 'C:\Courses\Datasets\Incomplete+Datasets\glass';
D = dir([Location, '\*.xlsx']);
filenames = {D(:).name}.';
data = cell(length(D),1);
for ii = length(D):-1:1 
      fullname = [Location filesep D(ii).name];
      data = xlsread(fullname);  
       [r,col] = size(data);
 for ncl=col:col
     data = xlsread(fullname);
  [r,col] = size(data);
  ex1=data;
  org_data = data;
  a=1;
  count = zeros(1,a);
  for i=1:r
      for j=1:col
          if(isnan(data(i,j)))
              count(a,:) = i;
              a = a+1;
              break;
          end
      end
  end
   [count_rows,count_columns] = size(count);
  for k=1:count_rows
     uplimit = count(k,1)-1;
     lwlimit = count(k,1)+1;
     for m=1:col
         if(isnan(data(count(k,1),m)))
             %ul = data(uplimit,m);
             %lw = data(lwlimit,m);
             %average = (ul+lw)/2;
             data(count(k,1),m) = 0;
         end
     end
  end
  answer=100;
  value=col;

    total=0;
    ttl1=0;
    %prompt='Number of clusters:';
    %ncl=input(prompt);
   [p,c]= kmeans(data,ncl);
   [cr,cc] = size(c);
   [pr,pc] = size(p);
  [mr,mc] = size(count);
  for t=1:mr
     
      for h=1:col
          if(isnan(org_data(count(t),h)))
              org_data(count(t),h) = c(p(count(t),1),h);
          end
      end
  end
  
  actual_data = xlsread('C:\Courses\Datasets\Original+Datasets\glass.xlsx');
 % xlswrite('C:\Courses\Datasets\Imputed\glass\Comp5_UD.xlsx',org_data);
  [acdr,acdc] = size(actual_data);
  for g=1:acdr
      for h=1:acdc
          total=total+power(actual_data(g,h),2);
      end
  end
  total1=sqrt(total);
  
  [ex1r,ex1c] = find(isnan(ex1));
  [ex1rr,ex1rc]=size(ex1r);
  [ex1cr,ex1cc]=size(ex1c);
  for q=1:ex1rr
      for z=1:ex1cr
          diff=org_data(ex1r(q,1),ex1c(z,1))-actual_data(ex1r(q,1),ex1c(z,1));
          diff1=power(diff,2);
          ttl1=ttl1+diff1;
          ttl1=mod(ttl1,total1);
      end
  end
  numerator=sqrt(ttl1);
  nrms=numerator/total1;
  if(ncl==col)
      refvar=nrms;
  end
  if(refvar>nrms)
      refvar=nrms;
  end
  stem(nrms,ncl);hold on
  xlabel('NRMS');
  ylabel('Number Of Clusters');
 end
 disp(refvar);
end
