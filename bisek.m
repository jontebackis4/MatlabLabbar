function [ x ] = bisek( f, I )
%Söker rot med bisektionsmetoden
    a = I(1);
    b = I(2);
    c = b - (b - a)/2;
    fc = f(c);
    tol = 10e-6;
    count = 0;
    while( abs(b-c)) > tol
        count = count+1;
        if(f(a)<f(b))
            if f(c)<0
                a = c;
            else
                b = c;
            end
        else
            if f(c)<0
                b = c;
            else
                a = c;
            end
        end
        c = b - (b - a)/2;
    end
    x = [c count];
end

