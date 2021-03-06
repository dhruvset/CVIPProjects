function[m1,m2,m3,m4,image1] = dwtprj(a)

[row,col] =size(a);

lowpass = [1/(2^.5),1/(2^.5)];
highpass = [1/(2^.5),-1/(2^.5)];

%Level 1
%Apply low pass filter on a


c = conv2(a,lowpass); 

%for (i=1:1:row)
 %    for(j=1:1:col)
  %   if (j==1)
   %      c(i,j)= a(i,j)*lowpass(1,2);
    % else
   %      c(i,j)= a(i,j-1)*lowpass(1,1) + a(i,j)*lowpass(1,2);
    % end
     %end
 %end
 


%downsampling columns by taking even columns
ds1 = dyaddown(c,1,'r');


%ds1 =c(1:1:row,2:2:col);

%Apply low pass filter 

lowpassds1 = conv2(ds1,lowpass);

%for (i=1:1:row)
 %    for(j=1:1:col/2)
  %   if (j==1)
   %      lowpassds1(i,j)= ds1(i,j)*lowpass(1,2);
    % else
     %    lowpassds1(i,j)= ds1(i,j-1)*lowpass(1,1) + ds1(i,j)*lowpass(1,2);
     %end
     %end
 %end
 


%Downsampling lowpassds1 on rows by taking even rows
m1=dyaddown(lowpassds1,1,'c');


%m1 =lowpassds1(2:2:row,1:1:col/2);


%Horizontal Image
%Apply high pass filter

highpassds1=conv2(ds1,highpass);

%for (i=1:1:row)
 %    for(j=1:1:col/2)
  %   if (j==1)
   %      highpassds1(i,j)= ds1(i,j)*highpass(1,2);
   %  else
   %      highpassds1(i,j)= ds1(i,j-1)*highpass(1,1) + ds1(i,j)*highpass(1,2);
    % end
    % end
 %end



%Downsampling highpassds1 on rows by taking even rows
m2=dyaddown(highpassds1,1,'c');
%m2 =highpassds1(2:2:row,1:1:col/2);%horizontal


%Vertical
%Apply high pass filter on a

d = conv2(a,highpass);

% for (i=1:1:row)
 %    for(j=1:1:col)
  %   if (j==1)
   %      d(i,j)= a(i,j)*highpass(1,2);
   %  else
   %      d(i,j)= a(i,j-1)*highpass(1,1) + a(i,j)*highpass(1,2);
   %  end
   %  end
% end

%downsampling columns by taking even columns

ds2 = dyaddown(d,1,'r');
%ds2 =d(1:1:row,2:2:col);
%Apply low pass filter on ds1

lowpassds2 = conv2(ds2,lowpass);

%for (i=1:1:row)
%     for(j=1:1:col/2)
%     if (j==1)
%         lowpassds2(i,j)= ds2(i,j)*lowpass(1,2);
%     else
%         lowpassds2(i,j)= ds2(i,j-1)*lowpass(1,1) + ds2(i,j)*lowpass(1,2);
%     end
%     end
% end



%Downsampling lowpassds2 on rows by taking even rows

m3 = dyaddown(lowpassds2,1,'c'); %verticle

%m3 =lowpassds2(2:2:row,1:1:col/2);

%Diagonal Image
%Apply high pass filter on ds2

highpassds2 = conv2(ds2,highpass);

%for (i=1:1:row)
%     for(j=1:1:col/2)
%     if (j==1)
%        highpassds2(i,j)= ds2(i,j)*highpass(1,2);
%    else
%        highpassds2(i,j)= ds2(i,j-1)*highpass(1,1) + ds2(i,j)*highpass(1,2);
 %    end
 %    end
 %end


%Downsampling highpassds1 on rows by taking even rows

m4=dyaddown(highpassds2,1,'c');

%m4 =highpassds2(2:2:row,1:1:col/2);
m1 = imresize(m1,[128,128]);
m2 = imresize(m2,[128,128]);
m3 = imresize(m3,[128,128]);
m4 = imresize(m4,[128,128]);
