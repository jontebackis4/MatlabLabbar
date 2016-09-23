function [ x ] = fixpt( g, x0 )
%beräknar rot mha fixpunkts metoden
    tol = 10e-6;
    x = x0;
    xold = x+1;
    count = 0;
    while abs(x - xold) > tol
        xold = x0;
        x = g(xold)
        x0 = x;
        count = count +1;
    end
    x = [x count];
end

