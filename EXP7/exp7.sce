//EXP 7

//Dikshita Kambri 118A2044

clc;
clear all;
im=imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\toyobjects.png");

[r c] = size(im);
im = double(im);
prex = (1/6)*[-1 -1 -1;0 0 0;1 1 1];
prey = (1/6)*[-1 0 1;-1 0 1;-1 0 1];
sobx = (1/8)*[-1 -2 -1;0 0 0;1 2 1];
soby = (1/8)*[-1 0 1;-2 0 2;-1 0 1];
//Z=zeros(r+2,c+2);
//Z(2:r+1,2:c+1)=im;
outprex=zeros(r,c);
outprey=zeros(r,c);
outsobx=zeros(r,c);
outsoby=zeros(r,c);

for i=2:r-1
    for j=2:c-1
        x1 = im(i-1:i+1, j-1:j+1);
        outprex(i,j) = sum(prex.*x1)
        outprey(i,j) = sum(prey.*x1)
        outsobx(i,j) = sum(sobx.*x1)
        outsoby(i,j) = sum(soby.*x1)
    end
end

prewitt = abs(outprex) + abs(outprey);
sobel = abs(outsobx) + abs(outsoby)
figure(1)
imshow(uint8(im));
title('Original Image');
figure(2)
subplot(1,3,1),
imshow(uint8(abs(255*outprex/max(max(outprex)))));
title('Prewitt X-gradient');
subplot(1,3,2),
imshow(uint8(abs(255*outprey/max(max(outprex)))));
title('Prewitt Y-gradient');
subplot(1,3,3),
imshow(uint8(255*prewitt/max(max(prewitt))));
title('Prewitt Final');

figure(3)
subplot(1,3,1),
imshow(uint8(abs(255*outsobx/max(max(outprex)))));
title('Sobel X-gradient');
subplot(1,3,2),
imshow(uint8(abs(255*outsoby/max(max(outprex)))));
title('Sobel Y-gradient');
subplot(1,3,3),
imshow(uint8(255*sobel/max(max(sobel))));
title('Sobel final');
