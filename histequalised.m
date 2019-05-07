I=imread('fig0308a.tif');
J = histeq(I);
figure
subplot(1,2,1)
imshow(J)
title('Low Contrast Image')
subplot(1,2,2)
title('Histogram')
imhist(J,64)
