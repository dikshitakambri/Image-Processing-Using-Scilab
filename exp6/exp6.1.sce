//Arithmetic Mean Filter

//Dikshita Kambri 118A2044 A3

clc;
clear all;
im = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
imng = imnoise(im, 'gaussian',0,0.01);
imng = double(imng);
[r c] = size(imng);

//Zero pad the image
imgpad = zeros(r+2,c+2);
out = zeros(r,c);
outp = zeros(r+2,c+2);
rp = r+2;
cp = c+2;
imgpad(2:rp-1,2:cp-1) = imng;

//a=z
//[rp cp] = size(imgpad);
for i=2: rp-1
    for j= 2:cp-1
        x= imgpad(i-1:i+1, j-1:j+1)
        outp(i,j) = sum(x)/9; //arithmetic mean
        b(i,j) = (prod(x))^(1/9); //geometric mean
        x = gsort(x); //median filter
        b1(i,j)= x(5);
    end
end
figure(1)
subplot(1,2,1)

//figure(1)
title('Original Image');
imshow(im);
subplot(1,2,2)

//figure(2)
title("Noisy Image");
imshow(uint8(imng);
subplot(1,3,3)

//figure(3)
title("Output Image");
imshow(uint8(outp(2:rp-1, 2: cp-1)));

