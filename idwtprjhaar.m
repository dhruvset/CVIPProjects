function [exlh, exhl] = idwtprjhaar(lh,hl)

[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('haar');

%LH
% upscale columns

upColtemp= dyadup(lh, 1, 'c');

upCol = upColtemp(:,1:end-1);

% Apply high pass on LH

[Row Col] = size(upCol);
 for i=1:Row
        HpassLH(i,:) = conv(upCol(i,:), Hi_R,'same');
 end
    

 upRowtemp = dyadup(HpassLH, 1, 'r');
upRow = upRowtemp(1:end-1,:);

%Apply low pass on LH 
[Row Col] = size(upRow);
for i=1:Col
        LpassLH(:,i) = conv(upRow(:,i), Lo_R,'same');
end
exlh=LpassLH;


%HL
% upscale columns

upColtemp= dyadup(hl, 1, 'c');

upCol = upColtemp(:,1:end-1);

% Apply low pass on HL

[Row Col] = size(upCol);
 for i=1:Row
        LpassHL(i,:) = conv(upCol(i,:), Lo_R,'same');
 end
    

 upRowtemp = dyadup(LpassHL, 1, 'r');
upRow = upRowtemp(1:end-1,:);

%Apply high pass on HL
[Row Col] = size(upRow);
for i=1:Col
        HpassHL(:,i) = conv(upRow(:,i), Hi_R,'same');
end
exhl=HpassHL;
 
 

