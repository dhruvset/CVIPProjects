function [m1,m2,m3,m4] = dwtprjex(a)
%a=im2double(imread('lena.bmp'));
[row,col] =size(a);

[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('db4');

%Level 1
%Apply low pass filter on a
c=zeros(row,col);
for i=1:col
     c(:,i) = conv(a(:,i),Lo_D,'same');
end

Lpass = c(1:2:end,:);


% Apply high pass on a
 
 c=zeros(row,col);
 for i=1:col
      c(:,i) = conv(a(:,i),Hi_D,'same');
 end
 
 Hpass = c(1:2:end,:);


%Apply low pass on Lpass

[nRow nCol] = size(Lpass);
lowpassds1=zeros(nRow,nCol);
for i=1:nRow
     lowpassds1(i,:) = conv(Lpass(i,:),Lo_D,'same');   
end

m1 = lowpassds1(:,1:2:end);

%Apply high pass on Lpass
[nRow nCol] = size(Lpass);
lowpassds1=zeros(nRow,nCol);
for i=1:nRow
     lowpassds1(i,:) = conv(Lpass(i,:),Hi_D,'same');   
end

m2 = lowpassds1(:,1:2:end);

%Apply low pass on Hpass

[nRow nCol] = size(Hpass);
lowpassds1=zeros(nRow,nCol);
for i=1:nRow
     lowpassds1(i,:) = conv(Hpass(i,:),Lo_D,'same');   
end

m3 = lowpassds1(:,1:2:end);

%Apply high pass on Hpass
[nRow nCol] = size(Hpass);
lowpassds1=zeros(nRow,nCol);
for i=1:nRow
     lowpassds1(i,:) = conv(Hpass(i,:),Hi_D,'same');   
end

m4 = lowpassds1(:,1:2:end);
