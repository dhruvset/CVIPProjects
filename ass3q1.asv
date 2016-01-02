roboprv = [0 1; -1 0];
roboprh = [1 0; 0 -1];
gx = conv2(ConvBoatDoG,roboprh);
gy = conv2(ConvBoatDoG,roboprv);
g = abs(gx);
g= g + abs(gy);

imshow(g);
g = abs(gx);
g= g + abs(gy);
save = g;









g2 = save;
for i=1:1:391
for j=1:1:391
if(g2(i,j)>2)
g2(i,j) = 1;
else
g2(i,j)=0;
end
end
end
g5=save;
for i=1:1:391
for j=1:1:391
if(g5(i,j)>5)
g5(i,j) = 1;
else
g5(i,j)=0;
end
end
end

g10 = save
for i=1:1:391
for j=1:1:391
if(g10(i,j)>10)
g10(i,j) = 1;
else
g10(i,j)=0;
end
end
end

g2 = save;
for i=1:1:391
for j=1:1:391
if(g2(i,j)>2)
g2(i,j) = 1;
else
g2(i,j)=0;
end
end
end
g5=save;
for i=1:1:391
for j=1:1:391
if(g5(i,j)>5)
g5(i,j) = 1;
else
g5(i,j)=0;
end
end
end

g7 = save


g0 = save
for i=1:1:391
for j=1:1:391
if(g0(i,j)>0)
g0(i,j) = 1;
else
g0(i,j)=0;
end
end
end


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

for i=1:1:391
for j=1:1:391
if(g7(i,j)<1)
zcBoat(i,j)=0;
end
end
end

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

            