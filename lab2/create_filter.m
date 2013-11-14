function [ H ] = create_filter( type, w,h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(nargin<3)
    w=3;
    h=3;
end;

switch type
    case 1
        H=ones(w,w)/(w*w)
    case 2
        H=ones(w,h)/(w*h)
    case 3
        H=[1,1,1;1,-8,1;1,1,1];
    case 4
        H=[0,1,0;1,-4,1;0,1,0];
    case 5
        H=[-1,-2,-1;0,0,0;1,2,1];
    case 6
        H=[-1,0,1;-2,0,2;-1,0,1];
    otherwise
end;

end

