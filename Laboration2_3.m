n = 11;  %Alltid udda!
h = 5/(n-1);

xi = @(i) (5*(i-1))/(n-1);
xi2 = @(i) (5*(i-1))/(n+n-2);
f = @(x) exp(sin(x));

for i = 1:n
    x(i) = xi(i);
end

for i = 1:n+n-1
    xh2(i) = xi2(i);
end

IS = simpson(1/4, xh2, f);
ITh = trapets(h, x, f);

%fplot(p);

ITh2 = trapets(1/4, xh2, f);

Q = richardson(2, ITh2, ITh);

%disp(IS)
%disp(ITh)

%disp(Q);
I = integral(f, 0, 5);

%disp(['Fel simpson ' num2str(abs(IS - I))])
%disp(['Fel trapets ' num2str(abs(ITh - I))])


%% 
dispP = 0;
n = 10;
alph = 3/2;
Icorr = 1/(alph -1);
f = @(x) 1/(x^alph);
for n = 10: 10: 20000
    h(n/10) = ((pi/2)-atan(1))/n;
    I = infmit(f, 1, Inf, n);
    disp(['nte: ' num2str(n) ' : ' num2str(I) '  Icorr: ' num2str(Icorr) ]);
    err(n/10) = abs(Icorr - I); 
end
if dispP == 1;
    for j = 2:length(err)
        disp(log(err(j)/err(j-1))/log(h(j)/h(j-1)));
    end
end