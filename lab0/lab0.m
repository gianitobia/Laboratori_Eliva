clear;
close all;

%%%esercizio 1
maxx = 255;
maxy = maxx;
y = 0:maxy;
f = 8;
s = cos(2*pi*f*y/(maxy+1));   % s is a sine oscillating between -1 and 1
sinimage = ones(maxx+1,1)*s;   % copy a row to build an image
%imshow(sinimage, []);   % y increases right, x increases downward
colormap(gray);

%%%%%%esercizio 2
sinimage=zeros(maxx+1,maxy+1,3);
r=cos(2*pi*6*y/(maxy+1));
b=cos(2*pi*8*y/(maxy+1));
g=cos(2*pi*4*y/(maxy+1));
sinimage(:,:,1)=ones(maxx+1,1)*r;
sinimage(:,:,2)=ones(maxx+1,1)*g;
sinimage(:,:,3)=ones(maxx+1,1)*b;

%figure;
%imshow(sinimage, []);

%%%%%esercizio 3 rettangolo
img=zeros(maxx,maxy);
img(maxx/2-30:maxx/2+30,maxy/2-50:maxy/2+50)=255*ones(61,101);

%imshow(img);

%%%%%esercizio 3 cerchio
img=zeros(maxx,maxy);
cx=100;
cy=100;
r=50;
for i=1:maxx
    for j=1:maxy
        dist=sqrt((cx-i)^2+(cy-j)^2);
        if dist<r
            img(i,j)=255;
        end;
    end;
end;

%figure;imshow(img);

%4 - rumore random, Guassiano
lena = imread('lena512.bmp');
err = uint8((rand(size(lena)).*20)-10);
subplot(1,2,1);
imshow(lena);
subplot(2,2,2);
imshow(lena-err);
subplot(2,2,4);
imshow(imnoise(lena, 'gaussian',0, 0.005));
%8
figure;
imhist(lena);


%6
lena_rgb = imread('lena_rgb.jpg');
figure;
subplot(1,2,1);
imshow(lena_rgb);
subplot(3,2,2);
imshow(lena_rgb(:,:,1));
title('canale rosso');
subplot(3,2,4);
imshow(lena_rgb(:,:,2));
title('canale verde');
subplot(3,2,6);
imshow(lena_rgb(:,:,3));
title('canale blu');

figure;imhist(lena_rgb(:,:,1));
figure;imhist(lena_rgb(:,:,2));
figure;imhist(lena_rgb(:,:,3));

figure;imshow(255-lena);
figure;imshow(255-lena_rgb);

figure; imshow(lena_rgb(342:-1:1,453:-1:1,:))
img = log(log(double(lena)));
imshow(uint8(img), []);

imshow(lena(1:size(lena)/2);

%{
Z = fft2(sinimage);  % make the fft of sinimage having null average, i.e. no DC component
Zmodcent = abs(fftshift(Z));
figure; imshow(Zmodcent);
%}