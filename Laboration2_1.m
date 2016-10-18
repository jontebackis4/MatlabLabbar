f = @(x)2*x*exp(x-1)-(x^2 + 2*x - 1); %f(x)
fprim = @(x)2*exp(x-1) + 2*x*exp(x-1) -(2*x+2);
g = @(x)((x^(2) -1)/(2*(exp(x-1)-1)));

x = bisek(f, [-2.5 -2.25]);
[y, eNew] = newrap(f, fprim, 1.25);
[z, eFix] = fixpt(g, 1.25);


i = [-3 3];
fplot(f, i);
hold on;
fplot(g,i);
grid on;
disp(['bisek: ' num2str(x(1)) ' med ' num2str(x(2)) ' iterationer' ]);
disp(['newton raphson: ' num2str(y(1)) ' med ' num2str(y(2)) ' iterationer']);
disp(['fixpunkt: ' num2str(z(1)) ' med ' num2str(z(2)) ' iterationer' ]);

disp(['-------------------------------------']);

disp(['   newton fel 1   newton fel 2']);
for k = 2:y(2)
    fel = abs(eNew(k)/eNew(k-1));
    fel2 = abs(eNew(k)/eNew(k-1)^2);
    disp([num2str(k-1) ': ' num2str(fel) '        ' num2str(fel2) ]);
end
disp(['-------------------------------------']);
disp(['   fixpunkt fel 1   fixpunkt fel 2']);
for k = 2:z(2)
    fel = abs(eFix(k)/eFix(k-1));
    fel2 = abs(eFix(k)/eFix(k-1)^2);
    disp([num2str(k-1) ': ' num2str(fel) '        ' num2str(fel2) ]);
end