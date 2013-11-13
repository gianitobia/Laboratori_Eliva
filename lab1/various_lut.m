clear all;
close all;

I=imread('../lena512.bmp');
maxlevel = 255;
baselut = [0:maxlevel]/maxlevel;
%lut 1 NEGATIVE LUT
lut1 = uint8 ((1 - baselut) * maxlevel);
%%%lut2 funzione a gradini larghi m
m=16;
lut2=[0:255];
lut2=uint8(lut2/m);
lut2=lut2*m;
%%%lut3 funzione c*r^gamma
c=2;
r=[0:1/255:1];
gamma=3;
lut3=(c.*r.^gamma);
A=min(lut3);
B=max(lut3);
lut3=uint8((lut3-A)/(B-A)*255)
%lut4 LEVELS EVIDENTIATION LUT
l1 = 52; l2 = 73;
lut4 = uint8([0:maxlevel]);
lut4(1:l1) = 0;
lut4(l2:maxlevel+1) = 0;
lut4(l1+1:l2-1) = 255;


I2=intlut(I,uint8(lut4));
plot(lut4);
figure;imshow(I);
figure;imshow(I2);