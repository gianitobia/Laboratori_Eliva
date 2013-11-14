clear;
close all;

%%%esercizio 1 creare un immagine con un onda sinusoidale orizzontale
maxx = 255;
maxy = maxx;
y = 0:maxy;
f = 8;
%creiamo un vettore con i valori della funzione cos
s = cos(2*pi*f*y/(maxy+1));  
%moltiplichiamo il vettore s per un vettore di 1 cosi da creare una
%matrice con tutte righe identiche ad s
sinimage = ones(maxx+1,1)*s;   
imshow(sinimage, []);   
colormap(gray);

%%%esercizio 2 creare un immagine con sinusoidi a frequenze differenti
%%%sulle tre componenti cromatiche
%costruzione di una matrice tridimensionale per avere un immagine a colori
sinimage=zeros(maxx+1,maxy+1,3);
%sinusoidi per i 3 canali dell'immagine con frequenze pari a 6,8,4
r=cos(2*pi*6*y/(maxy+1));
b=cos(2*pi*8*y/(maxy+1));
g=cos(2*pi*4*y/(maxy+1));
sinimage(:,:,1)=ones(maxx+1,1)*r;
sinimage(:,:,2)=ones(maxx+1,1)*g;
sinimage(:,:,3)=ones(maxx+1,1)*b;
figure, imshow(sinimage, []);

%%%esercizio 3 costruzione di un immagine nera con un rettangolo bianco
%%%al centro
img=zeros(maxx,maxy);
img(maxx/2-30:maxx/2+30,maxy/2-50:maxy/2+50)=255*ones(61,101);
imshow(img);

%%%esercizio 3 costruzione di un immagine nera con un cerchio centrato in
%%%(cx,cy) e raggio r

img=zeros(maxx,maxy);
cx=100;
cy=100;
r=50;
for i=1:maxx
    for j=1:maxy
        %selezioniamo solo i pixel che hanno distanza dal centro del
        %cerchio minore del raggio del cerchio
        dist=sqrt((cx-i)^2+(cy-j)^2);
        if dist<r
            img(i,j)=255;
        end;
    end;
end;
figure;imshow(img);

figure();
%blockproc è una funzione che scompone la matrice in blocchi nxn e applica
%una certa func su ogni blocco separatamente e poi li ricompone
%%%esercizio 13
fun = @(block_struct) mean(mean(block_struct.data)).*ones(size(block_struct.data));
I = imread('../lena512.bmp');
subplot(2,2,1)
I2 = blockproc(I,[8 8],fun);
imshow(uint8(I2));
%%%%esercizio 14
fun2 = @(block_struct) std2(block_struct.data).*double(ones(size(block_struct.data)));
subplot(2,2,2)
I3 = blockproc(I,[8 8],fun2);
imshow(uint8(I3));
%%%%esercizio 15
fun3 = @(block_struct) uint8(max(max(block_struct.data))).*uint8(ones(size(block_struct.data)));
subplot(2,1,2)
I4 = blockproc(I,[8 8],fun3);
imshow(uint8(I4));


%{
Z = fft2(sinimage);  % make the fft of sinimage having null average, i.e. no DC component
Zmodcent = abs(fftshift(Z));
figure; imshow(Zmodcent);
%}