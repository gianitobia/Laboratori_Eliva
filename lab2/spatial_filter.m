clear all;
close all;
I=double(rgb2gray(imread('chiodi.jpg')));
w=3;
h=3;
subplot(2,4,1);
imshow(uint8(I));
for f=1:6
H=create_filter(f,w,h);

Ifilt=imfilter(I,H);
subplot(2,4,f+1);
imshow(uint8(Ifilt));
title(strcat(num2str(f),' w*h=',num2str(w),'*',num2str(h)));
end;
Hx=create_filter(5);
Hy=create_filter(6);
Ix=imfilter(I,Hx);
Iy=imfilter(I,Hy);
M=sqrt(double(Ix.^2+Iy.^2));
figure();
subplot(1,2,1);
imagesc(uint8(M));
colorbar;
title('Magnitudo');
fase=atan2(double(Iy),double(Ix));
subplot(1,2,2);
imagesc(fase);
colorbar;
title('Fase');
figure;
Mbin=M>240;
imagesc(Mbin);
i=1;
for angle=0:pi/8:pi-pi/8
tres=pi/24;
hor=(abs(fase-angle)<tres);
subplot(2,4,i)
imshow(Mbin.*(double(hor)),[])
title(rad2deg(angle))
i=i+1;
end