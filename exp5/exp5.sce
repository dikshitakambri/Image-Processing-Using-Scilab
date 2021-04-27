 // Erosion and dilation

//118A2044 Dikshita Kambri

clc;
clear all;
im = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\blobs.png");
b=[1 1 1;1 1 1;1 1 1];
[r c]=size(im)
e=zeros(r,c)
d=zeros(r,c)
o=zeros(r,c)
cl=zeros(r,c)
a=find(b==1)
count=length(a);
boundary=zeros(r,c);

for i=2:r-1
    for j=2:c-1
        t=im(i-1:i+1,j-1:j+1)
        x=sum(t.*b)
        if x==count
            e(i,j)=1
            d(i,j)=1
        elseif x>=1
            e(i,j)=0
            d(i,j)=1
        else
            e(i,j)=0
            d(i,j)=0
        end
    end
end

figure(1)
subplot(1,2,1)
title('original')
imshow(uint8(255*im));
subplot(1,2,2)
title('erosion')
imshow(uint8(255*e));

figure(2)
subplot(1,2,1)
title('original')
imshow(uint8(255*im));
subplot(1,2,2)
title('dilation')
imshow(uint8(255*d));
    
figure(3)
subplot(1,2,1)
title('original')
imshow(uint8(255*im));
subplot(1,2,2)
title('Boundary Extracted')
imshow(uint8(255*boundary));

//opening
for i=2:r-1
    for j=2:c-1
        t=e(i-1:i+1,j-1:j+1)
        x=sum(t.*b)
        if x>=1
            o(i,j)=1
        else
            o(i,j)=0
        end
    end
end

//closing
for i=2:r-1
    for j=2:c-1
        t=d(i-1:i+1,j-1:j+1)
        x=sum(t.*b)
        if x==count
            cl(i,j)=1
        else
            cl(i,j)=0
        end
    end
end

figure(4)
subplot(1,2,1)
title('opening')
imshow(uint8(255*o));
subplot(1,2,2)
title('closing')
imshow(uint8(255*cl));
