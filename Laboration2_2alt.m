n = 21;
xe = -2:4/(99/(n-1)*(n-1)):2;
f = @(x) 1/(sqrt(1+8*(x-1/9)^2));

[x, y] = xyLabb2(n);
hPol = interpVander(n);
count = 1;
for i = xe
    yPol(count) = hPol(i);
    yCor(count) = f(i);
    count = count + 1;
end

yInt = interp1(x, y, xe);
ySpl = spline(x, y, xe);

errYpol = RMSE(length(yPol), yPol, yCor);
errYint = RMSE(length(yInt), yInt, yCor);
errYspl = RMSE(length(ySpl), ySpl, yCor);
disp(['fel högsta pol: ' num2str(errYpol)]);
disp(['fel interp1: ' num2str(errYint)]);
disp(['fel spline: ' num2str(errYspl)]);
disp(['------------------------'])
%%
n = 11;
f = @(x) 1/(sqrt(1+8*(x-1/9)^2));

hold on;
tol = 1e-3;
h = 1;

for n = 6:30
    h = 4/(n-1);
    xe = -2:4/(99/(n-1)*(n-1)):2;
    
    [x, y] = xyLabb2(n);
    hPol = interpVander(n);
    
    count = 1;
    for i = xe
        yPol(count) = hPol(i);
        yCor(count) = f(i);
        count = count + 1;
    end

    yInt = interp1(x, y, xe);
    ySpl = spline(x, y, xe);

    errYpol = RMSE(length(yPol), yPol, yCor);
    errYint = RMSE(length(yInt), yInt, yCor);
    errYspl = RMSE(length(ySpl), ySpl, yCor);
    %scatter(h, errYpol, 'r');
    %scatter(h, errYint, 'b');
    %scatter(h, errYspl, 'g','filled');
    Hvec(n-5) = h;
    EV(n-5) = errYspl;
end
%disp(Hvec)
%disp(EV)

grid on;
%loglog(Hvec, EV, '*');
%line(Hvec, EV);

summa = 0;

for k = 2:length(Hvec)
    p = log(EV(k)/EV(k-1))/log(Hvec(k)/Hvec(k-1));
    summa = summa + p;
end
disp(summa/length(Hvec));

%%
    evYpol = yPol - yCor;
    evYint = yInt - yCor;
    evYspl = ySpl - yCor;