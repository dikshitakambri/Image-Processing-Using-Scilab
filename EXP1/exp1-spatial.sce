//Dikshita Kambri 118A2044

//IPMV -EXPERIMENT 1

//Spatial RESOLUTION

clear all
clc;
a = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
[row , col] = size(a);
i = 1; j =1;
for x = 1:2 :row
    for y = 1:2:col
        c(i,j)= a(x,y);
        j = j+1;
    end
    j=1;
    i=i+1;
end

disp('size of input image');
disp(size(a));
disp('size of output image');
disp(size(c));
figure(2)
imshow(c)
