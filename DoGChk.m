function DoGChk()

DoGMask = [0 0 -1 -1 -1 0 0; 0 -2 -3 -3 -3 -2 0; -1 -3 5 5 5 -3 -1; -1 -3 5 16 5 -3 -1; -1 -3 5 5 5 -3 -1; 0 -2 -3 -3 -3 -2 0; 0 0 -1 -1 -1 0 0];
boatimage =imread('boats.png','png');
boatimage = im2double(boatimage);
%boatimage = rgb2gray(boatimage);
ConvBoatDoG = conv2(boatimage,DoGMask);

padConvBoatDoG = ConvBoatDoG;
NewConvBoatDoG = padConvBoatDoG;
for i=2:1:391
for j=2:1:391
a = padConvBoatDoG(i,j);

if(a<=0)
    b = padConvBoatDoG(i-1,j-1);
    c = padConvBoatDoG(i,j-1);
    d = padConvBoatDoG(i-1,j);
    if(b>0 || c>0 || d>0)
        NewConvBoatDoG(i-1,j-1) = 1;
    else
        NewConvBoatDoG(i-1,j-1) = 0;
    end
elseif (a>0)
    b = padConvBoatDoG(i-1,j-1);
    c = padConvBoatDoG(i,j-1);
    d = padConvBoatDoG(i-1,j);
    if(b<0 || c<0 || d<0)
        NewConvBoatDoG(i-1,j-1) = 1;
    else
        NewConvBoatDoG(i-1,j-1) = 0;
    end
end

end
end


roboprv = [0 -1; 1 0];
roboprh = [-1 0; 0 1];

NewConvBoatDoG1 = conv2(ConvBoatDoG,roboprv);
NewConvBoatDoG1 = conv2(NewConvBoatDoG1,roboprh);


maxval= 0;
minval = 0;

for i=1:1:392
  for j=1:1:392
  
if (NewConvBoatDoG1(i,j)>maxval)
    maxval = NewConvBoatDoG1(i,j);
end    

if (NewConvBoatDoG1(i,j)<minval)
    minval = NewConvBoatDoG1(i,j);
end    

end
end

maxval;
minval;
%imshow(NewConvBoatDoG1);
for i=1:1:392
  for j=1:1:392
  
if (abs(NewConvBoatDoG1(i,j))>=5)
    NewConvBoatDoG1(i,j)=1;
else
    NewConvBoatDoG1(i,j)=0;
end    

end
end

imshow(NewConvBoatDoG1);


end