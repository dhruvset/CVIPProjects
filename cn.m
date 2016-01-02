a= imread ('lena.bmp','bmp');
H = [0.0025,0.0125,0.02,0.0125,0.0025;0.0125,0.0625,0.1,0.0625,0.0125;0.02,0.1,0.16,0.1,0.02;0.0125,0.0625,0.1,0.0625,0.0125;0.0025,0.0125,0.02,0.0125,0.0025];
lena = im2double(a);
padlena = padarray ( lena,[2,2]);
R=zeros(512,512);
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