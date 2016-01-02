function[] = proj1()

a=imread('lena.bmp','bmp');
a=im2double(a);

%Decomposition level 1

[ll1, lh1, hl1, hh1]=dwtprjex(a);
[ll2, lh2, hl2, hh2]=dwtprjex(ll1);
[ll3, lh3, hl3, hh3]=dwtprjex(ll2);
[relh2, rehl2] = idwtprjhaar(lh3,hl3);
[relh1, rehl1] = idwtprjhaar(relh2,rehl2);
[relh0, rehl0] = idwtprjhaar(relh1,rehl1);


figure('Name','Haar Wavelet: Fusion at level 3','NumberTitle','off')
fused = max(relh2,rehl2);
imshow(fused,[]);


figure('Name','Haar Wavelet: Fusion at level 2','NumberTitle','off')
fused = max(relh1,rehl1);
imshow(fused,[]);


figure('Name','Haar Wavelet: Fusion at level 1','NumberTitle','off')
fused = max(relh0,rehl0);
imshow(fused,[]);



[ll1, lh1, hl1, hh1]=dwtprjex(a);
[ll2, lh2, hl2, hh2]=dwtprjex(ll1);
[ll3, lh3, hl3, hh3]=dwtprjex(ll2);
[relh2, rehl2] = idwtprj(lh3,hl3);
[relh1, rehl1] = idwtprj(relh2,rehl2);
[relh0, rehl0] = idwtprj(relh1,rehl1);



figure('Name','DB4 Wavelet: Fusion at level 3','NumberTitle','off')
fused = max(relh2,rehl2);
imshow(fused,[]);


figure('Name','DB4 Wavelet: Fusion at level 2','NumberTitle','off')
fused = max(relh1,rehl1);
imshow(fused,[]);


figure('Name','DB4 Wavelet: Fusion at level 1','NumberTitle','off')
fused = max(relh0,rehl0);
imshow(fused,[]);