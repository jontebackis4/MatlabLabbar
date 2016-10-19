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
xlabel('Tid (s)');
ylabel('Utslagsvinkel (rad)');


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