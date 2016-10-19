% a)

L = 1/2; %längd på pendelns snöre
g = 9.82; %gravitation
theta0 = (5:5:90)*(pi/180); %startvinkel intervall

k = sin(theta0/2); %vektor

for i = 1:length(k)
    f = @(x) 1./(sqrt(1 - (k(i).^2) * sin(x).^2));
    I = integral(f, 0, pi/2);
    T(i) = 4 * sqrt(L/g) * I;   %Periodtiden
end

Startvinkel = theta0'*(180/pi);
Tidperioden = T';




% b)

apprT = 2*pi*sqrt(L/g);

Fel = (abs(T - apprT))./T;
En_procent_fel = zeros([length(k) 1]);
Tio_procent_fel = zeros([length(k) 1]);
for i = 1:length(Fel)
    if Fel(i) < 1/10
        Tio_procent_fel(i) = 1;
    end
    if Fel(i) < 1/100
        En_procent_fel(i) = 1;
    end
end
Table = table(Startvinkel, Tidperioden, En_procent_fel, Tio_procent_fel)