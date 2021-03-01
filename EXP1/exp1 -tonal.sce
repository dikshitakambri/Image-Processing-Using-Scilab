//Dikshita Kambri 118A2044

//IPMV -EXPERIMENT 1

//TONAL RESOLUTION//

clear all
clc;
a = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
a = double(a);
//b = max(max(a);
b = 256;
i =input("How many bits do you want? 1 2 4 8: ");
j = b/(2^i);
F = floor(a/j);
F1 = (F * 255)/max(max(F));
figure(1)
imshow(uint8(a))
figure(2)
imshow(uint8(F1))

