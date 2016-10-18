n = 21;
xe = -2:4/(99/(n-1)*(n-1)):2;
f = @(x) 1/(sqrt(1+8*(x-1/9)^2));

hold on;
axis([-2.3 2.3 0 1]);

[x, y] = xyLabb2(n);

k = 1;
for i = xe
    CorrY(k) = f(i);
    k = k + 1;
end
    
P = interpVander(n);

count = 0;
for i = xe
    count = count + 1;
    ye(count) = P(i);
    %scatter(i, P(i), 'b');
end

disp(length(ye));

yInt = interp1(x, y, xe);
ySpl = spline(x, y, xe);

%scatter(xe, yInt, 'g');
%scatter(xe, ySpl, 'r');

%fplot(f);

disp(length(ye));

%RMSE felet
% Intervander
E1 = RMSE(n, ye, CorrY);
disp(['Högsta grad: ' num2str(E1)]);

%interp1
E2 = RMSE(n, yInt, CorrY);
disp(['Linjär interp: ' num2str(E2)]);

%spline
E3 = RMSE(n, ySpl, CorrY);
disp(['Kubisk spline:' num2str(E3)]);

%hold off;

%%
%hold on;
%grid on;
[xold, yold] = xyLabb2(6);
yIntOld = interp1(xold, yold, xe);
ySplOld = spline(xold, yold, xe);
for i = 7:30
    [x, y] = xyLabb2(i);
    yInt = interp1(x, y, xe);
    ySpl = spline(x, y, xe);
    pInt(i-6) = log(RMSE(i, yInt, y)/(RMSE(i-1, yIntOld, yold)))/log((4/(i-1))/(4/(i-2)));
    pSpl(i-6) = log(RMSE(i, ySpl, y)/(RMSE(i-1, ySplOld, yold)))/log((4/(i-1))/(4/(i-2)));
    xold = x;
    yold =y;
    yIntOld = yInt;
    ySplOld = ySpl;

end


for j = 1:length(pInt)
    %disp(['p för int: ' num2str(pInt(j))]);
end
for j = 1:length(pSpl)
    %disp(['p för spl: ' num2str(pSpl(j))]);
end

%loglog(h, abs(felV), '*');
%line(h, felV);



