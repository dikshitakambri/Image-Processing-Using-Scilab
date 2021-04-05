//DCT TRANSFORM

clc;
clear all;
r = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\rice.png");
[r1 c1] = size(r);
n = min(r1, c1);
res = imresize(r, [n n]);
dres = double(res);
C = zeros(n,n);
for i =0 : n-1
    for j=0: n-1
        if i==0 then
            C(i+1, j+1)= sqrt(1/n);
        else
            C(i+1,j+1)= sqrt(2/n)*cos((((2*j)+1)*i*%pi)/(2*n));
        end
    end
end
F = C*dres*C';
f = C'*F*C;
figure(1)

//subplot(1,3,1)
imshow(res);
title('Input original Image');

subplot(1,3,2)
figure(2)
imshow(uint8(F));
title("Image after applying DCT");

//subplot(1,3,3)
figure(3)
imshow(uint8(f));
title("reconstrcted image");
