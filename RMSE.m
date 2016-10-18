function [ E ] = RMSE( n, y, f )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i = 1:length(y)
        e(i) = y(i) - f(i);
    end
    
    E = (1/sqrt(n))*norm(e,2);
end

