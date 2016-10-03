n = 81;  %Alltid udda!
h = 5/(n-1);

xi = @(i) (5*(i-1))/(n-1);
xi2 = @(i) (5*(i-1))/(n+n-2);
f = @(x) exp(sin(x));

for i = 1:n
    x(i) = xi(i);
end

for i = 1:n+n-1
    %xh2(i) = xi2(i);
end

IS = simpson(h, x, f);
ITh = trapets(h, x, f);

%fplot(p);

%ITh2 = trapets(1/4, xh2, f);

%Q = richardson(2, ITh2, ITh);

%disp(IS)
%disp(ITh)


I = integral(f, 0, 5);

disp(['Fel simpson ' num2str(abs(IS - I))])
disp(['Fel trapets ' num2str(abs(ITh - I))])