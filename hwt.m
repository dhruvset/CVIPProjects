
%function hwt()

lf = [1/(2^.5),1/(2^.5)];
hf = [1/(2^.5),-1/(2^.5)];
a=imread('lena.bmp','bmp');
a=im2double(a);

%Approximation
%Apply low pass filter on a
c = conv2(lf,a);
%downsampling columns by taking even columns
ds1 =c(1:1:512,2:2:513);
%Apply low pass filter on ds1
lfds1 = conv2(lf,ds1);
%Downsampling lfds1 on rows by taking even rows
m1 =lfds1(2:2:512,1:1:257);
%imshow(m1);

%Horizontal Image
%Apply high pass filter on ds1
hfds1 = conv2(hf,ds1);
%Downsampling hfds1 on rows by taking even rows
m2 =hfds1(2:2:512,1:1:257);
%imshow(m2);



%Vertical
%Apply high pass filter on a
d = conv2(hf,a);
%downsampling columns by taking even columns
ds2 =d(1:1:512,2:2:513);
%Apply low pass filter on ds1
lfds2 = conv2(lf,ds2);
%Downsampling lfds1 on rows by taking even rows
m3 =lfds2(2:2:512,1:1:257);
%imshow(m3);

%Diagonal Image
%Apply high pass filter on ds1
hfds2 = conv2(hf,ds2);
%Downsampling hfds1 on rows by taking even rows
m4 =hfds2(2:2:512,1:1:257);
%imshow(m4);

imageharrfinal = [m1 m2; m3 m4];
imshow(imageharrfinal);
%end