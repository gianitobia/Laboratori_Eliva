function [ C ] = quantizzazione( X, r )
% QUANTIZZAZIONE
% la funzione quantizza l'immagine X in base agli r bit indicati (da 1 a 7)

delta=256/(2^r);
q_X=floor(double(X)/delta);
C=q_X*delta;

end

