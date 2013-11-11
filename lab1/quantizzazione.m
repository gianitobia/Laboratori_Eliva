function [ C ] = quantizzazione( X, r )
delta=256/(2^r);
q_X=floor(double(X)/delta);
C=q_X*delta;

end

