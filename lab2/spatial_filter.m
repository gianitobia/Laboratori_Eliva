%%  FILTRO SPAZIALE
%   lo script visualizza l'applicazione di 7 diversi filtri spaziali
%   in più identifica ed evidenzia dei pixel di immagine appartenenti a
%   bordi orientati secondo una direzione data. (nel nostro caso ogni 22.5°)

clear all;
close all;
% acquisisco e converto l'immagine da filtrare
I=double(imread('../lena512.bmp'));
% definisco le dimensioni della maschera
w=3;
h=9;
% plot dell'immagine originale con i 6 filtri base
subplot(2,4,1);
imshow(uint8(I));
title('originale');
for f=1:6
    H=create_filter(f,w,h);
    Ifilt=imfilter(I,H);
    subplot(2,4,f+1);
    imshow(uint8(Ifilt));
    title(strcat('type=',num2str(f)));
end;
% creo i 2 filtri Sobel (orizz. e vert.) per effettuare la combinazione di
% essi per calcolare MODULO e FASE del gradiente.
Hx=create_filter(5);
Hy=create_filter(6);
Ix=imfilter(I,Hx);
Iy=imfilter(I,Hy);
% calcolo la magnitudine e la fase e li mostro
M=sqrt(double(Ix.^2+Iy.^2));
fase=atan2(double(Iy),double(Ix));
figure();
subplot(1,2,1);
imagesc(uint8(M));
colorbar;
title('Magnitudo');
subplot(1,2,2);
imagesc(fase);
colorbar;
title('Fase');
% carico l'immagine per l'individuazione dei bordi orientati
I=double(rgb2gray(imread('chiodi.jpg')));
% utilizzo i filtri Sobel
Ix=imfilter(I,Hx);
Iy=imfilter(I,Hy);
% calcolo della magnitudine e della fase
M=sqrt(double(Ix.^2+Iy.^2));
fase=atan2(double(Iy),double(Ix));
% binarizzo l'immagine con threshold a 240
Mbin=M>240;
% mostro l'immagine originale, magnitudo e magnitudo binarizzata
figure();
subplot(1,3,1);
imshow(uint8(I));
title('originale');
subplot(1,3,2);
imagesc(M);
title('magnitudo');
subplot(1,3,3);
imagesc(Mbin);
title('magnitudo binarizzata');
i=1;
% mostro i bordi evidenziati ogni 22.5° grazie alla loro fase
figure();
for angle=0:pi/8:pi-pi/8
    tres=pi/24;
    hor=(abs(fase-angle)<tres);
    subplot(2,4,i)
    imshow(Mbin.*(double(hor)),[])
    title(rad2deg(angle))
    i=i+1;
end