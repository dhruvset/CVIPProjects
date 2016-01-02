function [inv] = idwtprjex(ip)

[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('haar');


% upscale columns

upColtemp= dyadup(ip, 1, 'c');

upCol = upColtemp(:,1:end-1);

% Apply high pass on LH

[Row Col] = size(ip);
 for i=1:Row
        HpassLH(i,:) = conv(ip(i,:), Hi_R,'same');
 end
    

 upRowtemp = dyadup(HpassLH, 1, 'r');
upRow = upRowtemp(1:end-1,:);

%Apply low pass on LH 

for i=1:Col
        LpassLH(:,i) = conv(upRow(:,i), lowFilter,'same');
end

inv = LpassLH;




 
 

