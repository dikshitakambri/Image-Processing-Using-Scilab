//Contrast stretching

// Dikshita Kambri

//118A2044  TE EXTC A3

clc;
clear all;
im = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
figure(1),
imshow(im);
title("Input image");
im = double(im);
[r,c] = size(im);
jm = zeros(r,c); //output matrix
a = 100;
b = 170;
v = 50;
w = 200;
l = v/a;
m = (w-v)/(b-a);
n=(255-w)/(255-b);

for i =1:r
    for j = 1:c
        if im(i,j) < a then
            jm(i,j) = l *im(i,j);
        elseif im(i,j) < b then
            jm(i,j) = m*(im(i,j) -a)+v;
        else
            jm(i,j) = n* (im(i,j) -b)+w;
        end
    end
end 
figure(2),
imshow(uint8(jm));
title('Output image');
