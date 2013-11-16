%% SCRIPT di Quantizzazione
% lo script effettua la quantizzazione di immagine e mostra la distorsione
% fra l'immagine originale e quella quantizzata per tutti e 7 i bit.

x=imread('../lena512.bmp');
figure;
subplot(2,4,1);
imshow(x);
title('immagine originale');
% creo un vettore di zeri in cui inserire i valori della distorsione
D=zeros(1,7);
% quantizzo l'immagine da 1 a 7 bit
for r=1:7
    c=quantizzazione(x,r);
    subplot(2,4,r+1);
    imshow(uint8(c));
    title(strcat(num2str(r),' bit'));
    % calcolo la distorsione su r bit
    D(r)=distortion(double(x),c);
    display(strcat(r, ' fatto'));
end;
% mostro il grafico della distorsione e lo confronto con il modello
% analitico.
figure();
plot(D);
hold on;
r=1:7;
plot((256.^2)./(2.^(2.*r).*12),'r')