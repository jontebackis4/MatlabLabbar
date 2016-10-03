function [ Q ] = richardson( p, Fh2, Fh )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    Q = (2^p*Fh2 - Fh)/(p^2 - 1);

end

