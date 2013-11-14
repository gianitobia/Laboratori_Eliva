%% GENERAZIONE LUT
% lo script mostra le diverse applicazioni della lut
clear all;
close all;

I=imread('../lena512.bmp');
maxlevel = 255;
% casto la lut da 0:255 a 0:1
baselut = [0:maxlevel]/maxlevel;
% lut 1 LUT negativa
lut1 = uint8 ((1 - baselut) * maxlevel);
% lut2 funzione a gradini larghi m
m=16;
lut2=[0:255];
lut2=uint8(lut2/m);
lut2=lut2*m;
% lut3 funzione c*r^gamma
c=2;
r=[0:1/255:1];
gamma=3;
lut3=(c.*r.^gamma);
A=min(lut3);
B=max(lut3);
lut3=uint8((lut3-A)/(B-A)*255);
% lut4 LUT a livelli
lev1 = 52; 
lev2 = 73;
lut4 = uint8([0:maxlevel]);
lut4(1:lev1) = 0;
lut4(lev2:maxlevel+1) = 0;
lut4(lev1+1:lev2-1) = 255;
% mostro l'immagine originale
figure;imshow(I);
% mostro le immagini elaborate e la lut
figure;
subplot(2,4,1);
I2=intlut(I,uint8(lut1));
imshow(I2);
title('lut inversa');
subplot(2,4,2);
plot(lut1);
subplot(2,4,3);
I2=intlut(I,uint8(lut2));
imshow(I2);
title('lut a gradini');
subplot(2,4,4);
plot(lut2);
subplot(2,4,5);
I2=intlut(I,uint8(lut3));
imshow(I2);
title('lut gamma');
subplot(2,4,6);
plot(lut3);
subplot(2,4,7);
I2=intlut(I,uint8(lut4));
imshow(I2);
title('lut a livelli');
subplot(2,4,8);
plot(lut4);
