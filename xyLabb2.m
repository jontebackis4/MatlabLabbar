function [ x, y ] = xyLabb2( n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    f = @(x) 1/(sqrt(1+8*(x-1/9)^2));
    xi = @(i) -2+4*(i-1)/(n-1);
    
    for i = 1:n+1
        x(i) = xi(i);
        y(i) = f(x(i));
    end

end

