    /// Frequency Domain Filters
    
///Dikshita Kambri 118A2044 A

clc;
clear all;
im=imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\coins.png");
im=double(im);
[r c]=size(im);
I1=fft2(im);
Is=fftshift(I1);

// Defining filters
D0=30;
n=5;
Hi=zeros(r,c);
Hb=zeros(r,c);
Hg=zeros(r,c);

for i=1:r
    for j=1:c
        D=sqrt(((r/2)-i)^2+((c/2)-j)^2);
        /// IDEAL LOW PASS FILTER
        if D<=D0 then
            Hi(i,j)=1;
        else
            Hi(i,j)=0;
        end
        
        /// BUTTERWORTH LOW PASS FILTER
        Hb(i,j)=(1/(1+(D/D0)^2*n));
        /// GAUSSIAN LOW PASS FILTER
        Hg(i,j)=exp(-D^2/(2*D0^2));
    end
end

Gi=Is.*Hi;
Gb=Is.*Hb;
Gg=Is.*Hg;
gi=abs(ifft(Gi));
gb=abs(ifft(Gb));
gg=abs(ifft(Gg));

figure(1)
subplot(1,3,1)
mesh(Hi);
title('3-D Ideal low pass Filter');
subplot(1,3,2)
mesh(Hb);
title('3-D Butterworth low pass Filter');
subplot(1,3,3)
mesh(Hg);
title('3-D Gaussian low pass Filter');

figure(2)
subplot(1,3,1)
imshow(uint8(255*Hi));
title('2-D Ideal low pass Filter');
subplot(1,3,2)
imshow(uint8(255*Hb));
title('2-D Butterworth low pass Filter');
subplot(1,3,3)
imshow(uint8(255*Hg));
title('2-D Gaussian low pass Filter');

figure(3)
subplot(1,3,1)
imshow(uint8(Gi));
title('FT of ILPF Filtered Output');
subplot(1,3,2)
imshow(uint8(Gb));
title('FT of BLPF Filtered Output');
subplot(1,3,3)
imshow(uint8(Gg));
title('FT of GLPF Filtered Output');

figure(4)
subplot(1,3,1)
imshow(uint8(gi));
title('ILPF Filtered image');
subplot(1,3,2)
imshow(uint8(gb));
title('BLPF Filtered image');
subplot(1,3,3)
imshow(uint8(gg));
title('GLPF Filtered image');
