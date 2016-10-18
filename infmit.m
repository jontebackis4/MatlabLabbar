function [ I ] = infmit( f, a, b, n )
    a = atan(a);
    b = pi/2;
    h = (b-a)/n;
    I = 0;
    for i = 1:n
        x = a + (i-1/2)*h;
        I = I + f(tan(x))/((cos(x))^2);
    end

    I = I*h;

end

