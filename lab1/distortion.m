function [ D ] = distortion( orig, mod )
D=0;
dim=size(orig);
D=sum(sum(abs(orig-mod).^2))/(dim(1)*dim(2));