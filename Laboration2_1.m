f = @(x)2*x*exp(x-1)-(x^2 + 2*x - 1); %f(x)
fprim = @(x)2*exp(x-1) + 2*x*exp(x-1) -(2*x+2);
g = @(x)((x^(2) -1)/(2*(exp(x-1)-1)));

x = bisek(f, [-2.5 -2.25]);
y = newrap(f, fprim, -2.5);
z = fixpt(g, -2.5);


i = [-3 3];
fplot(f, i);
hold on;
fplot(g,i);
grid on;
disp(['bisek: ' num2str(x(1)) ' med ' num2str(x(2)) ' iterationer' ]);
disp(['newton raphson: ' num2str(y(1)) ' med ' num2str(y(2)) ' iterationer']);
disp(['fixpunkt: ' num2str(z(1)) ' med ' num2str(z(2)) ' iterationer' ]);