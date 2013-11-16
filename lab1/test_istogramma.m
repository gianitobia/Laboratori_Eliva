I = imread('../lena512.bmp');
ist=istogramma(I);
bar(ist);
figure;
imhist(I);