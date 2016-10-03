function [ I ] = simpson( h, x, f )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    I = f(x(1));
    
    for i = 2:length(x)-1
        if mod(i, 2) == 0
            I = I + 4*f(x(i));
        else
            I = I + 2*f(x(i));
        end
    end
    
    I = I + f(x(end));
    
    I = I*h/3;
end

