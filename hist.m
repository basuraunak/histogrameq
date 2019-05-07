I=imread('fig0308a.tif');
figure
subplot(1,2,1)
imshow(I)
title('Low Contrast Image')
subplot(1,2,2)
title('Histogram')
imhist(I,64)


