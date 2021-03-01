///Basic Commands

img1 = imread('C:\Users\hp\Documents\Image Processing-Scilab\Images\onion.png'); //filepath stored in variable
imshow(img1); //display image
img2 = rgb2gray(img1);//convert colour image into grayscale image
imshow(img2);
[r,c] = size(img2); //rows and column of 2-d matrix
imax = max(max(img2));
disp(imax);
imin = min(min(img2));
disp(imin);

//img3 = imread("C:\Users\hp\Documents\Image Processing-Scilab\Images\circles.png");
//imshow(img3);
//imax = max(max(img3));
//disp(imax);
//imin = min(min(img3));
//disp(imin);

img3 = zeros(r,c);

a = 150 //threshold

for x = 1:r
    for y = 1:c
        if img2(x, y) < 150 then
            img3(x, y) = 0;
        else 
            img3(x, y) = 255;
        end
    end
end

imshow(img3);

