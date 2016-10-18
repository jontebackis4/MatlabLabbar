function [ x, e ] = newrap( f, fprim, x0 )
%söker rot med newton raphson-metoden
    tol = 1e-6;
    x = x0;
    xold = x0+1;
    count = 0;
    while abs(x - xold)> tol
        xold = x;
        count = count +1;
        x = xold - (f(xold)/fprim(xold));
        e(count) = abs(x - xold);
    end
    x = [x count];
end

