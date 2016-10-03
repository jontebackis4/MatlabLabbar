function [ I ] = trapets( h, x, f )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    I = f(x(1));
    
    for i = 2:length(x)-1
        I = I + 2*f(x(i));
    end
    
    I = I + f(x(end));
    
    I = I*h/2;

end

