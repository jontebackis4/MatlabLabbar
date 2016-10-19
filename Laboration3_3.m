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