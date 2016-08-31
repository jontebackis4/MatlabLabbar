
a = input('a = ');
b = input('b = ');
c = input('c = ');

x = -5:5;

y = a*power(x,2) + b*x + c;

plot(x, y)

x1 = -b/(2*a) + sqrt(power((b/(2*a)), 2) - c/a);
x2 = -b/(2*a) - sqrt(power((b/(2*a)), 2) - c/a);

disp(['Root 1: ' num2str(x1) ])
disp(['Root 2: ' num2str(x2) ])

hold on;

if isreal(x1)
    plot(x1, 0, 'ro')
end

if isreal(x2)
    plot(x2, 0, 'ro')
end

p = [a b c];
r = roots(p);

disp('Correct roots: ')
disp(r)

