function [ k ] = yPrimZero( yp )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    k = 1;
    while yp(k) < 0
        k = k + 1;
    end
end

