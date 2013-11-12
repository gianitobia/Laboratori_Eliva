clear;
A = imread('The_Police.jpg');
A = rgb2gray(A);
%% LUT
maxlevel = 255;
baselut = [0:maxlevel]/maxlevel;

%NEGATIVE LUT
%lut = uint8 ((1 - baselut) * maxlevel);

%GAMMA LUT
%gamma = 2.5;
%lut = uint8((baselut.^gamma)*maxlevel);

%LOGARITMIC LUT
%lut = uint8((log10(1+150*baselut)/log10(max(1+150*baselut)))*maxlevel);

%STEP LUT
%stepdim = 0.5;
%lut = uint8(round(baselut/stepdim)/max(baselut/stepdim)*maxlevel);

% LEVELS EVIDENTIATION LUT
%l1 = 52; l2 = 73;
%lut = uint8([0:maxlevel]);
%lut(1:l1) = 0;
%lut(l2:maxlevel+1) = 0;
%lut(l1+1:l2-1) = 255;
 

imshow(A);

%B = intlut(A, lut);
figure; imshow(B);
figure; plot(lut);