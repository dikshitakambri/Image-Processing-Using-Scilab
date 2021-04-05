// Histogram Equalisation
clc;
clear all;
im=imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\onion.png");
figure(1),
imshow(im);
title('Imput image');
im=double(im);
[r c]=size(im);
jm=zeros(r,c);//output matrix
//input histogram
nk=zeros(1,256);
//for lvl=0:255
//    a=find(im==lvl);
//    l=lvl+1;
//    nk(l)=length(a);
//end
t=0;
for p=1:r
    for q=1:c
        t=im(p,q);
        nk(t+1)=nk(t+1)+1;
    end
end
figure(2), bar(nk);
title('Original image histogram');
pdf=nk/(r*c);
cdf(1)= pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
sk=round(255*cdf);
//for rk=0:255
//    b=find(im==rk);
//    r1=rk+1;
//    jm(b)=sk(r1);
//end
// Replacing the input pixels by new value
for x=1:r
    for y=1:c
        temp=im(x,y);
        jm(x,y)=sk(temp+1);
    end
end
mk=zeros(r,c);
//for v=0:255
//    p=find(jm==v);
//    v1=v+1;
//    mk(v1)=length(p);
//end
// Histogram of the equalised image
s=0;
for p=1:r
    for q=1:c
        s=jm(p,q);
        mk(s+1)=mk(s+1)+1;
    end
end
figure(3), imshow(uint8(jm));
title('Equalised image');
figure(4), bar(mk);
title('Equalised image Histogram');

