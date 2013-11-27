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