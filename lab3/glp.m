function [ H ] = glp( D0,w,h )
    [X,Y]=meshgrid(1:w,1:h);
    D=sqrt((X-w/2).^2+(Y-h/2).^2);
    H=exp(-D.^2/(2*D0^2));
end