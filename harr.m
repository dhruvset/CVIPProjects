%Substitute the Path with the path of the image lena
a=imread('lena.bmp','bmp');
a=im2double(a);

lowpass = [1/(2^.5),1/(2^.5)];
highpass = [1/(2^.5),-1/(2^.5)];

%Level 1
%Apply low pass filter on a


 for (i=1:1:512)
     for(j=1:1:512)
     if (j==1)
         c(i,j)= a(i,j)*lowpass(1,2);
     else
         c(i,j)= a(i,j-1)*lowpass(1,1) + a(i,j)*lowpass(1,2);
     end
     end
 end
 


%downsampling columns by taking even columns
ds1 =c(1:1:512,2:2:512);

%Apply low pass filter 

for (i=1:1:512)
     for(j=1:1:256)
     if (j==1)
         lowpassds1(i,j)= ds1(i,j)*lowpass(1,2);
     else
         lowpassds1(i,j)= ds1(i,j-1)*lowpass(1,1) + ds1(i,j)*lowpass(1,2);
     end
     end
 end
 


%Downsampling lowpassds1 on rows by taking even rows
m1 =lowpassds1(2:2:512,1:1:256);


%Horizontal Image
%Apply high pass filter


for (i=1:1:512)
     for(j=1:1:256)
     if (j==1)
         highpassds1(i,j)= ds1(i,j)*highpass(1,2);
     else
         highpassds1(i,j)= ds1(i,j-1)*highpass(1,1) + ds1(i,j)*highpass(1,2);
     end
     end
 end



%Downsampling highpassds1 on rows by taking even rows
m2 =highpassds1(2:2:512,1:1:256);


%Vertical
%Apply high pass filter on a


 for (i=1:1:512)
     for(j=1:1:512)
     if (j==1)
         d(i,j)= a(i,j)*highpass(1,2);
     else
         d(i,j)= a(i,j-1)*highpass(1,1) + a(i,j)*highpass(1,2);
     end
     end
 end

%downsampling columns by taking even columns
ds2 =d(1:1:512,2:2:512);
%Apply low pass filter on ds1

for (i=1:1:512)
     for(j=1:1:256)
     if (j==1)
         lowpassds2(i,j)= ds2(i,j)*lowpass(1,2);
     else
         lowpassds2(i,j)= ds2(i,j-1)*lowpass(1,1) + ds2(i,j)*lowpass(1,2);
     end
     end
 end



%Downsampling lowpassds1 on rows by taking even rows
m3 =lowpassds2(2:2:512,1:1:256);

%Diagonal Image
%Apply high pass filter on ds1



for (i=1:1:512)
     for(j=1:1:256)
     if (j==1)
         highpassds2(i,j)= ds2(i,j)*highpass(1,2);
     else
         highpassds2(i,j)= ds2(i,j-1)*highpass(1,1) + ds2(i,j)*highpass(1,2);
     end
     end
 end


%Downsampling highpassds1 on rows by taking even rows
m4 =highpassds2(2:2:512,1:1:256);


image1 = [m1 m2 ; m3 m4];
figure('Name','Level 1 Decomposition','NumberTitle','off');
imshow(image1);

%Energy Calculation

e1(1) = sum(sum(m1.*m1));
e1(2) = sum(sum(m2.*m2));
e1(3) = sum(sum(m3.*m3));
e1(4) = sum(sum(m4.*m4));


%Level 2 
%Apply low pass filter on a

 for (i=1:1:256)
     for(j=1:1:256)
     if (j==1)
         c(i,j)= m1(i,j)*lowpass(1,2);
     else
         c(i,j)= m1(i,j-1)*lowpass(1,1) + m1(i,j)*lowpass(1,2);
     end
     end
 end
 


%downsampling columns by taking even columns
ds1 =c(1:1:256,2:2:256);
%Apply low pass filter on ds1


for (i=1:1:256)
     for(j=1:1:128)
     if (j==1)
         lowpassds1(i,j)= ds1(i,j)*lowpass(1,2);
     else
         lowpassds1(i,j)= ds1(i,j-1)*lowpass(1,1) + ds1(i,j)*lowpass(1,2);
     end
     end
 end
 


%Downsampling lowpassds1 on rows by taking even rows
twom1 =lowpassds1(2:2:256,1:1:128);

%Apply high pass filter on ds1


for (i=1:1:256)
     for(j=1:1:128)
     if (j==1)
         highpassds1(i,j)= ds1(i,j)*highpass(1,2);
     else
         highpassds1(i,j)= ds1(i,j-1)*highpass(1,1) + ds1(i,j)*highpass(1,2);
     end
     end
 end



%Downsampling highpassds1 on rows by taking even rows
twom2 =highpassds1(2:2:256,1:1:128);


%Vertical
%Apply high pass filter on a


 for (i=1:1:256)
     for(j=1:1:256)
     if (j==1)
         d(i,j)= m1(i,j)*highpass(1,2);
     else
         d(i,j)= m1(i,j-1)*highpass(1,1) + m1(i,j)*highpass(1,2);
     end
     end
 end

%downsampling columns by taking even columns
ds2 =d(1:1:256,2:2:256);
%Apply low pass filter on ds1


for (i=1:1:256)
     for(j=1:1:128)
     if (j==1)
         lowpassds2(i,j)= ds2(i,j)*lowpass(1,2);
     else
         lowpassds2(i,j)= ds2(i,j-1)*lowpass(1,1) + ds2(i,j)*lowpass(1,2);
     end
     end
 end



%Downsampling lowpassds1 on rows by taking even rows
twom3 =lowpassds2(2:2:256,1:1:128);

%Diagonal Image
%Apply high pass filter on ds1


for (i=1:1:256)
     for(j=1:1:128)
     if (j==1)
         highpassds2(i,j)= ds2(i,j)*highpass(1,2);
     else
         highpassds2(i,j)= ds2(i,j-1)*highpass(1,1) + ds2(i,j)*highpass(1,2);
     end
     end
 end


%Downsampling highpassds1 on rows by taking even rows
twom4 =highpassds2(2:2:256,1:1:128);

image2 = [twom1 twom2 ; twom3 twom4];
figure('Name','Level 2 Decomposition','NumberTitle','off');
imshow(image2);

%Energy Calculation

e2(1) = sum(sum(twom1.*twom1));
e2(2) = sum(sum(twom2.*twom2));
e2(3) = sum(sum(twom3.*twom3));
e2(4) = sum(sum(twom4.*twom4));


%Level 3 
%Apply low pass filter on a

 for (i=1:1:128)
     for(j=1:1:128)
     if (j==1)
         c(i,j)= twom1(i,j)*lowpass(1,2);
     else
         c(i,j)= twom1(i,j-1)*lowpass(1,1) + twom1(i,j)*lowpass(1,2);
     end
     end
 end
 


%downsampling columns by taking even columns
ds1 =c(1:1:128,2:2:128);
%Apply low pass filter on ds1


for (i=1:1:128)
     for(j=1:1:64)
     if (j==1)
         lowpassds1(i,j)= ds1(i,j)*lowpass(1,2);
     else
         lowpassds1(i,j)= ds1(i,j-1)*lowpass(1,1) + ds1(i,j)*lowpass(1,2);
     end
     end
 end
 


%Downsampling even rows
threem1 =lowpassds1(2:2:128,1:1:64);

%Horizontal Image
%Apply high pass filter on ds1

for (i=1:1:128)
     for(j=1:1:64)
     if (j==1)
         highpassds1(i,j)= ds1(i,j)*highpass(1,2);
     else
         highpassds1(i,j)= ds1(i,j-1)*highpass(1,1) + ds1(i,j)*highpass(1,2);
     end
     end
 end



%Downsampling even rows
threem2 =highpassds1(2:2:128,1:1:64);

%Vertical
%Apply high pass filter on a

 for (i=1:1:128)
     for(j=1:1:128)
     if (j==1)
         d(i,j)= twom1(i,j)*highpass(1,2);
     else
         d(i,j)= twom1(i,j-1)*highpass(1,1) + twom1(i,j)*highpass(1,2);
     end
     end
 end

%downsampling even columns
ds2 =d(1:1:128,2:2:128);
%Apply low pass filter on ds1


for (i=1:1:128)
     for(j=1:1:64)
     if (j==1)
         lowpassds2(i,j)= ds2(i,j)*lowpass(1,2);
     else
         lowpassds2(i,j)= ds2(i,j-1)*lowpass(1,1) + ds2(i,j)*lowpass(1,2);
     end
     end
 end



%Downsampling lowpassds1 on rows by taking even rows
threem3 =lowpassds2(2:2:128,1:1:64);

%Diagonal Image
%Apply high pass filter on ds1


for (i=1:1:128)
     for(j=1:1:64)
     if (j==1)
         highpassds2(i,j)= ds2(i,j)*highpass(1,2);
     else
         highpassds2(i,j)= ds2(i,j-1)*highpass(1,1) + ds2(i,j)*highpass(1,2);
     end
     end
 end


%Downsampling highpassds1 on rows by taking even rows
threem4 =highpassds2(2:2:128,1:1:64);

image3 = [threem1 threem2 ; threem3 threem4];
figure('Name','Level 3 Decomposition','NumberTitle','off');
imshow(image3);

%Energy Calculation

e3(1) = sum(sum(threem1.*threem1));
e3(2) = sum(sum(threem2.*threem2));
e3(3) = sum(sum(threem3.*threem3));
e3(4) = sum(sum(threem4.*threem4));

e1(1)=0;
e2(1)=0;
e3(1)=0;

figure('Name','Energy Plot of level 1 decomposition','NumberTitle','off');
stem(e1);

figure('Name','Energy Plot of Level 2 Decomposition','NumberTitle','off');
stem(e2);

figure('Name','Energy Plot of level 3 decomposition','NumberTitle','off');
stem(e3);

