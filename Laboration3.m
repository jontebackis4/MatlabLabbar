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
%%
l = 1/2; %längd på pendelns snöre
g = 9.82; %gravitation
h = 0.01;
T = 0:h:2;
n = length(T)-1;
Y = zeros(2, n+1);
Y(:,1) = [25*(pi/180); 0];

F = @(Y) [Y(2); -(g/l)*sin(Y(1))];

for j = 1:n
    Y(:, j+1) = Y(:,j) + h.*F(Y(:, j));
end

hold on;
for i = 1:n
    scatter(T(i),Y(1,i), 'r');
end

Y = zeros(2, n+1);
Y(:,1) = [50*(pi/180); 0];
for j = 1:n
        Y(:, j+1) = Y(:,j) + h.*F(Y(:, j));
end

for i = 1:n
    scatter(T(i),Y(1,i), 'b');
end

%%   d)


g = 9.82;
l = 0.5;

thetaStart = 25*(pi/180);

F = @(Y) [Y(2); -(g/l)*sin(Y(1))];

H = 0.1;
for i = 1:10
    h(i) = H;
    H = H/2;
end

for i = 1:length(h)
    
    t = 0:h(i):2;
    n = length(t) - 1;
    Y = zeros(2, n+1);
    Y(:,1) = [thetaStart; 0];
    for j = 1:n
        Y(:, j+1) = Y(:,j) + h(i).*F(Y(:, j));
    end
    
    f = @(x) spline(t, Y(2,:), x);
    periodApprox(i) = 2*fzero(f, 0.75);
    
    Fel(i) = abs(periodApprox(i) - 1.4348)/1.4348;
    
end

H = h';
Period = periodApprox';
Fel = Fel';
Table = table(H, Period, Fel);
disp(Table);


%% e)

g = 9.82;
l = 0.5;

thetaStart = 25*(pi/180);

F = @(Y) [Y(2); -(g/l)*sin(Y(1))];

H = 0.1;
for i = 1:10
    h(i) = H;
    H = H/2;
end

for i = 1:length(h)
    
    t = 0:h(i):2;
    n = length(t) - 1;
    Y = zeros(2, n+1);
    Y(:,1) = [thetaStart; 0];
    for j = 1:n
        Ytilde = Y(:, j) + h(i).*F(Y(:, j));
        Y(:, j+1) = Y(:,j) + (h(i)/2).*(F(Y(:, j)) + F(Ytilde));
    end
    
    f = @(x) spline(t, Y(2,:), x);
    periodApprox(i) = 2*fzero(f, 0.75);
    
    Fel(i) = abs(periodApprox(i) - 1.4348)/1.4348;
    
end

H = h';
Period = periodApprox';
Fel = Fel';
Table = table(H, Period, Fel);
disp(Table);
