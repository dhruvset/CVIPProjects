function ass3q1()

DoGMask = [0 0 -1 -1 -1 0 0; 0 -2 -3 -3 -3 -2 0; -1 -3 5 5 5 -3 -1; -1 -3 5 16 5 -3 -1; -1 -3 5 5 5 -3 -1; 0 -2 -3 -3 -3 -2 0; 0 0 -1 -1 -1 0 0];
boatimage =imread('boats.png','png');
boatimage = im2double(boatimage);
ConvBoatDoG = conv2(boatimage,DoGMask);
figure('Name','DoG','NumberTitle','off');
imshow(ConvBoatDoG);


zcBoat =zeros(391,391);
zerocrossingBoat = padarray(ConvBoatDoG,[1,1]);
for i=2:1:392
    for j=2:1:392
        a=zerocrossingBoat(i,j);
        if(a<=0)
            b=zerocrossingBoat(i-1,j-1);
            c=zerocrossingBoat(i,j-1);
            d=zerocrossingBoat(i-1,j);
            if(b>0 || c>0 || d>0)
                zcBoat(i-1,j-1)=1;
            else
                zcBoat(i-1,j-1)=0;
            end
        else if(a>0)
            b=zerocrossingBoat(i-1,j-1);
            c=zerocrossingBoat(i,j-1);
            d=zerocrossingBoat(i-1,j);
            if(b>0 || c>0 || d>0)
                zcBoat(i-1,j-1)=0;
            else
                zcBoat(i-1,j-1)=1;
            end
            end
        end
    end
end

figure('Name','Zero Crossing DoG','NumberTitle','off');
imshow(zcBoat);


roboprv = [0 1; -1 0];
roboprh = [1 0; 0 -1];
gx = conv2(ConvBoatDoG,roboprh);
gy = conv2(ConvBoatDoG,roboprv);
g = abs(gx);
g= g + abs(gy);

for i=1:1:391
for j=1:1:391
if(g(i,j)<5)
zcBoat(i,j)=0;
end
end
end

figure('Name','Zero Crossing strong edge threshold 5','NumberTitle','off');
imshow(zcBoat);



LoGMask = [0 0 1 0 0; 0 1 2 1 0; 1 2 -16 2 1; 0 1 2 1 0; 0 0 1 0 0];
ConvBoatLoG = conv2(boatimage,LoGMask);

gx = conv2(ConvBoatLoG,roboprh);
gy = conv2(ConvBoatLoG,roboprv);
glog=abs(gx)+abs(gy);
zclogBoat = zeros(388,388);
zerocrosslogpad = padarray(ConvBoatLoG,[1,1]);
for i=2:1:389
    for j=2:1:389
        a=zerocrosslogpad(i,j);
        if(a<=0)
            b=zerocrosslogpad(i-1,j-1);
            c=zerocrosslogpad(i,j-1);
            d=zerocrosslogpad(i-1,j);
            if(b>0 || c>0 || d>0)
                zclogBoat(i-1,j-1)=1;
            else
                zclogBoat(i-1,j-1)=0;
            end
        else if(a>0)
            b=zerocrosslogpad(i-1,j-1);
            c=zerocrosslogpad(i,j-1);
            d=zerocrosslogpad(i-1,j);
            if(b>0 || c>0 || d>0)
                zclogBoat(i-1,j-1)=0;
            else
                zclogBoat(i-1,j-1)=1;
            end
            end
        end
    end
end

figure('Name','Zero Crossing LoG','NumberTitle','off');
imshow(zclogBoat);

