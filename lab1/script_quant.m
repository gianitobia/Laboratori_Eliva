x=imread('prova.png');
figure;
subplot(2,4,1);
imshow(x);
title('immagine originale');
D=zeros(1,7);
for r=1:7
c=quantizzazione(x,r);
subplot(2,4,r+1);
imshow(uint8(c));
title(strcat(num2str(r),' bit'));
D(r)=distortion(double(x),c);
display(strcat(r, ' fatto'));
end;
figure();
plot(D);
hold on;
r=1:7;
plot((256.^2)./(2.^(2.*r).*12),'r')