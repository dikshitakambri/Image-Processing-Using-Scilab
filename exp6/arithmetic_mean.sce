//Arithmetic Mean Filter
// Dikshita Kambri 118A2044
clc;
clear all;
im = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
imng=imnoise(im,'gaussian',0,0.01);
imng-double(imng);
[r c]=size(imng);
//zero pad the image
imgpad=zeros (r+2,c+2); 
out=zeros(r,c);
outp=zeros(r+2,c+2);
rp=r+2;
cp=c+2;
imgpad(2:rp-1,2:cp-1)=imng;
//a=Z
//[rp cp]=size(imgpad);
for i=2:rp-1
    for j=2:cp-1
        x=imgpad (i-1:i+1,j-1:j+1)
        outp(i,j)=sum(x)/9;
    end
end

out=outp(2:rp-1,2:cp-1);
//subplot(1,3,1)
figure (1)
title('Original Image');
imshow(im);
figure (2)
//subplot(1,3,2)
title('Noisy Image');
imshow(uint8(imng));
//subplot(1,3,3)
figure(3)
title('Output Image'); 
imshow(uint8(out));

