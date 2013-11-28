function [ H ] = create_filter( type, w,h)
%CREATE_FILTER crea maschere per applicare filtri spaziali
%   in base ai parametri passati alla funzione si decide quale tipo di
%   maschera di filtro applicare.
%   in base ai valori di type otteniamo:
%   1) maschera di filtro media con dimensione quadrata WxW
%   2) maschera di filtro media con dimensione rettangolare WxH
%   3) maschera di filtro laplaciano non isotropico (3x3)
%   4) maschera di filtro laplaciano isotropico (3x3)
%   5) maschera di filtro Sobel orizzontale (3x3)
%   6) maschera di filtro Sobel verticale (3x3)
if(nargin<3)
    w=3;
    h=3;
end;

switch type
    case 1
        H=ones(w,w)/(w*w);
    case 2
        H=ones(w,h)/(w*h);
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

