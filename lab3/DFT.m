clear all, close all;

I = imread('tun.jpg');
f = [0.01,0.04,0.1,0.25,0.3,0.5,0.8];
beicolors = ['r','b','g','y','k','c','m'];
figure();
for i=1:7
    hold on;
    sinus = sin(2*pi*f(i)*(linspace(1,512)));
    fftsinus = fft(sinus);
    plot(abs(fftsinus),beicolors(i));
end

%% punto 1 
maxx = 255;
maxy = maxx;
y = 0:maxy;
f = 80;
% creiamo un vettore con i valori della funzione cos
s = cos(2*pi*f*y/(maxy+1));  
% moltiplichiamo il vettore s per un vettore di 1 cosi da creare una
% matrice con tutte righe identiche ad s
figure();
sinimage = ones(maxx+1,1)*s;   
imagesc(fftshift(abs(fft2(sinimage))));
colormap(gray);


%% punto 2
t = zeros(maxx+1,maxy+1);
t(78:178,123:133) = 1;
figure();
subplot(2,2,1);
imshow(t);
subplot(2,2,2);
imagesc(fftshift(log(abs(fft2(t)))));
subplot(2,2,3);
imagesc(imrotate(t,45));
subplot(2,2,4);
imagesc(fftshift(log(abs(fft2(imrotate(t,45))))));

%% punto 3
figure();
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
fsh = fftshift(fft2(I));
imagesc(log(abs(fsh)));
colormap(gray);
dim=size(I);
lp = ones(dim);
lp(dim(1)/2-10:dim(1)/2+10,dim(2)/2-10:dim(2)/2+10) = 0;
subplot(2,2,3);
imagesc(log(abs(fsh .* lp)));
subplot(2,2,4);
imshow(uint8(abs(ifft2(ifftshift(fsh .* lp)))));

%%punto 4
figure;
addpath ../lab2;
h_mean=create_filter(1,3,3);
h_zeros=zeros(101,101);
h_zeros(49:51,49:51)=h_mean;
H_mean=fft2(h_zeros);
subplot(2,3,1)
mesh(abs(fftshift(H_mean)))
title('filtro media 3x3');

h_mean=create_filter(1,5,5);
h_zeros=zeros(101,101);
h_zeros(48:52,48:52)=h_mean;
H_mean=fft2(h_zeros);
subplot(2,3,2)
mesh(abs(fftshift(H_mean)))
title('filtro media 5x5');


h_mean=create_filter(4,5,5);
h_zeros=zeros(101,101);
h_zeros(49:51,49:51)=h_mean;
H_mean=fft2(h_zeros);
subplot(2,3,3)
mesh(abs(fftshift(H_mean)))
title('laplaciano non isotropico')

h_mean=create_filter(5,5,5);
h_zeros=zeros(101,101);
h_zeros(49:51,49:51)=h_mean;
H_mean=fft2(h_zeros);
subplot(2,3,4)
mesh(abs(fftshift(H_mean)))
title('laplaciano isotropico')

rmpath ../lab2;

%%punto 5
I_fft=fft2(I);
dim=size(I);
H=glp(30,dim(2),dim(1));
I_filter=fftshift(I_fft).*H;
J=ifft2(ifftshift(I_filter));
imshow(uint8(abs(J)));

%%paddato
figure;
I_pad=[I,255*ones(dim);255*ones(dim),255*ones(dim)];
I_pad_fft=fft2(I_pad);
dim_pad=size(I_pad);
H_pad=glp(30,dim_pad(2),dim_pad(1));
I_pad_filter=fftshift(I_pad_fft).*H_pad;
J_pad=ifft2(ifftshift(I_pad_filter));
J_wo_pad=J_pad(1:dim(1),1:dim(2));
imshow(uint8(abs(J_wo_pad)));

figure;
subplot(1,2,1);
mesh(H);
subplot(1,2,2);
mesh(H_pad);