function [ x, e ] = fixpt( g, x0 )
%ber�knar rot mha fixpunkts metoden
    tol = 1e-6;
    x = x0;
    xold = x+1;
    count = 0;
    while abs(x - xold) > tol
        xold = x0;
        x = g(xold)
        x0 = x;
        count = count +1;
        e(count) = abs(x - xold);
    end
    x = [x count];
end

