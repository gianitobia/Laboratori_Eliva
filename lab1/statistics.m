I=imread('../lena512.bmp');
%% calcolo della media su blocchi a dimensione variabile tra 3,5,7,9
fun=@(block)mean(mean(block.data));
J=cell(1,4);
K=cell(1,4);
k=1;
for i=3:2:9
    J{k}=blockproc(I,[i i],fun);
    k=k+1;
end

%%come prima però calcolo della deviazione standard
fun=@(block)std2(block.data);
k=1;
for i=3:2:9
    K{k}=blockproc(I,[i i],fun);
    k=k+1;
end

%%costruire un immagine con i valori sostituiti dalla media dei valori del
%%blocco
fun=@(block)mean(mean(block.data))*ones(size(block.data));
subplot(2,3,1);
imshow(I);
title('orig')
k=2;
for i=3:2:9
    J=blockproc(I,[i i],fun);
    subplot(2,3,k);
    imshow(uint8(J));
    title(i);
    k=k+1;
end