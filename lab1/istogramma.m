function [ ist ] = istogramma( I )
%ISTOGRAMMA Summary of this function goes here
%   Detailed explanation goes here
ist=zeros(1,256);
for l=0:255
ist(l+1)=length(find(I==l));
end

