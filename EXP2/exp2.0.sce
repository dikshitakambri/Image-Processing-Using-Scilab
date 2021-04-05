//Histogram equlization

clc;
clear all;
im = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\office_2.jpg");
figure(1),
imshow(im);
title("Input image");
im = double(im);
[r,c]= size(im);
jm = zeros(r,c); //output matrix

//Input histogram

nk = zeros(1,256);
for lvl=0:255
    a=find(im==lvl);
    l = lvl+1;
    nk(1)=length(a);
end

figure(2), bar(nk);
title('Original image histogram');

pdf=nk/(r*c);
cdf(1)= pdf(1);
for(i = 2:256)
    cdf(i) = cdf(i-1) + pdf(i);
end

sk = round(255*cdf);

for rk=0:255
    b=find(im==rk);
    r1 = rk+1;
    jm(b)=sk(r1);
end
mk=zeros(r,c);

for v = 0:255
    p= find(im==v);
    v1 = v+1;
    mk(v1) = length(p);
end
figure(3), imshow(uint8(jm));
title("Equalized image");

figure()

