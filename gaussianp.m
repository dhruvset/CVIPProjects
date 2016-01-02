%Substitute the Path with the path of the image lena

a= imread ('lena.bmp','bmp');
H = [0.0025,0.0125,0.02,0.0125,0.0025;0.0125,0.0625,0.1,0.0625,0.0125;0.02,0.1,0.16,0.1,0.02;0.0125,0.0625,0.1,0.0625,0.0125;0.0025,0.0125,0.02,0.0125,0.0025];
lena = im2double(a);
padlena = padarray ( lena,[2,2]);
R=zeros(512,512);
%Gaussian Level1
for x=3:1:514
for y=3:1:514
mat = padlena(x-2:1:x+2,y-2:1:y+2);
for i=1:1:5
    for j=1:1:5
        mat(i,j)=mat(i,j)*H(i,j);
    end
end
for i=1:1:5
for j=1:1:5
R(x-2,y-2)=R(x-2,y-2)+mat(i,j);
end
end
end
end

g1 = R;
%imshow(g1);
%Gaussian level 2
%Downsampling it to get next level Gaussian G2
ds1 =g1(2:2:512,2:2:512);
ds1= padarray(ds1,[2,2]);
R=zeros(256,256);
%Convolving downsampled matrix with Gaussian kernal
for x=3:1:258
for y=3:1:258
mat = ds1(x-2:1:x+2,y-2:1:y+2);
for i=1:1:5
    for j=1:1:5
        mat(i,j)=mat(i,j)*H(i,j);
    end
end
for i=1:1:5
for j=1:1:5
R(x-2,y-2)=R(x-2,y-2)+mat(i,j);
end
end
end
end



%Gaussian Level3
g2 = R;
%imshow(g2);

%Downsampling it to get next level Gaussian G3
ds2 =g2(2:2:256,2:2:256);
ds2= padarray(ds2,[2,2]);
R=zeros(128,128);
%Convolving downsampled matrix with Gaussian kernal
for x=3:1:130
for y=3:1:130
mat = ds2(x-2:1:x+2,y-2:1:y+2);
for i=1:1:5
    for j=1:1:5
        mat(i,j)=mat(i,j)*H(i,j);
    end
end
for i=1:1:5
for j=1:1:5
R(x-2,y-2)=R(x-2,y-2)+mat(i,j);
end
end
end
end

%Gaussian Level3
g3 = R;

figure('Name','Gaussian Pyramid Level 1','NumberTitle','off')
imshow(g1);

figure('Name','Gaussian Pyramid Level 2','NumberTitle','off')
imshow(g2);

figure('Name','Gaussian Pyramid Level 3','NumberTitle','off')
imshow(g3);

figure('Name','Energy Plot','NumberTitle','off')

e=[0,0,0,0];
e(1)=sum(sum(lena.*lena));
e(2)=sum(sum(g1.*g1));
e(3)=sum(sum(g2.*g2));
e(4)=sum(sum(g3.*g3));
stem(e);

figure('Name','Energy Difference at each level','NumberTitle','off')
f=[0,0,0];
f(1)=sum(sum(lena.*lena))-sum(sum(g1.*g1));
f(2)=sum(sum(g1.*g1))-sum(sum(g2.*g2));
f(3)=sum(sum(g2.*g2))-sum(sum(g3.*g3));
f(1)=0;
stem(f);

