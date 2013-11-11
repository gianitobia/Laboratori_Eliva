clear all;
close all;

I=imread('../lena512.bmp');
%%%lut1 funzione a gradini larghi m
m=16;
lut1=[0:255];
lut1=uint8(lut1/m);
lut1=lut1*m;
%%%lut2 funzione c*r^gamma
c=2;
r=[0:1/255:1];
gamma=1/2;
lut2=(c.*r.^gamma);
A=min(lut2);
B=max(lut2);

lut2=uint8((lut2-A)/(B-A)*255)
I2=intlut(I,lut2);
plot(lut2);
figure;imshow(I);
figure;imshow(I2);