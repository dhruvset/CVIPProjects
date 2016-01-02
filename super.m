%create supergrid structure
boatsimg=imread('boats.png','png');
boatsimg = imresize(boatsimg,0.25);



s = ones(2*num_rows+1, 2*num_columns+1, 'int32');
s(1:2:end,:) = zeros(num_rows+1, 2*num_columns+1, 'int32');
s(:,1:2:end) = zeros(2*num_rows+1,num_columns+1,'int32');
s(2:2:2*num_rows,3:2:(2*num_columns-1)) = abs(boatsimg(:,2:end) - boatsimg(:,1:(end-1)));
s(3:2:(2*num_rows-1),2:2:2*num_columns) = abs(boatsimg(2:end,:) - boatsimg(1:(end-1),:));
[lable_arr,maxLable] = bwlabel(s,4); %lable_arr contains the region lables with maxLable as the number of regions

segImg = lable_arr(2:2:2*num_rows , 2:2:2*num_columns); %remives the unwanted values from the lable_arr retaining only the edge values
LableVals=1:maxLable;