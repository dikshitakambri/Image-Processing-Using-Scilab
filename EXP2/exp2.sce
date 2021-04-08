//Contrast stretching

//118A2044 Dikshita Kambri

clc;
clear all;
im = imread(')
imshow(im);
im = double(im);
[r,c] = size(im);


a =100;
b =170;

v=50;
w =200;
l = v/a;
m = (w-v)/(b-a);
n = (255-w)/(255-b);

for(i = 1:r)
    for j=1:c
        if im(i,j) < a then
            jm(i,j) =
    end
