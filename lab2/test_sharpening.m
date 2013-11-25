%image sharpening con laplaciano
I=imread('../lena512.bmp');
h=create_filter(4);
J=imfilter(I,h);

for c=0:0.1:1
    subplot(3,4,c*10+1);
    K=I+c*J;
    imshow(uint8(K));
    title(c);
end;

%image sharpening con sobel
G=imread('../lena512.bmp');
H=create_filter(1,5,5);
I=imfilter(G,H);
Hx=create_filter(5);
Hy=create_filter(6);
Ix=imfilter(I,Hx);
Iy=imfilter(I,Hy);

for c=0:0.3:1
    subplot(2,3,c*5+1);
    K=I+c*(Ix+Iy);
    
    imshow(uint8(K));
    title(c);
end;

%image sharpening con laplaciano binarizzando il gradiente
I=double(imread('../lena512.bmp'));
h=create_filter(4);
J=imfilter(I,h);
Jbin=abs(J)>40;
figure;
subplot(1,2,1)
imagesc(uint8(J));
subplot(1,2,2)
imagesc(uint8(Jbin));
figure;
for c=0:0.1:1
    subplot(3,4,c*10+1);
    K=I+c*double(Jbin);
    imshow(uint8(K));
    title(c);
end;

%Image unsharp filter
I = double(imread('../lena512.bmp'));
h = create_filter(1,5,5);
J = imfilter(I,h);
figure;
subplot(1,2,1);
imshow(uint8(I));
title('originale');
subplot(1,2,2);
imshow(uint8(J));
title('low_pass');
figure;
for a=1:0.2:2
    subplot(2,3,(a-1)*5+1);
    K=a*I-J;
    imshow(uint8(K));
    title(a);
end
