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

%Gaussian level 2
%Downsampling
ds1 =g1(2:2:512,2:2:512);
ds1= padarray(ds1,[2,2]);
R=zeros(256,256);

%Convolving with kernal
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

%Downsampling
ds2 =g2(2:2:256,2:2:256);
ds2= padarray(ds2,[2,2]);
R=zeros(128,128);
%Convolving with kernal
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

%Downsampling 
ds3 =g3(2:2:128,2:2:128);
ds3= padarray(ds3,[2,2]);
R=zeros(64,64);
%Convolving with kernal
for x=3:1:66
for y=3:1:66
mat = ds3(x-2:1:x+2,y-2:1:y+2);
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

g4=R;
%Laplacian Level 3
g3expand = imresize(g4,2);
l3 = g3 - g3expand;
%Laplacian Level 2
g2expand = imresize(g3,2);
l2 = g2 - g2expand ;
%Laplacian Level 1
g1expand = imresize(g2,2);
l1 = g1 - g1expand;


figure('Name','Laplacian Pyramid Lvl 3','NumberTitle','off')
imshow(l3);

figure('Name','Laplacian Pyramid Lvl 2','NumberTitle','off')
imshow(l2);

figure('Name','Laplacian Pyramid Lvl 1','NumberTitle','off')
imshow(l1);

figure('Name','Original Image','NumberTitle','off')
imshow(lena);

figure('Name','Energy difference Laplacian and Gaussian lvl 2','NumberTitle','off')
e = [0,0,0];


e(2)=sum(sum(g2.*g2))-sum(sum(l2.*l2));

stem(e);
