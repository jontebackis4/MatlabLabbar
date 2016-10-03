n = 30;
xe = -2:0.004:2;
f = @(x) 1/(sqrt(1+8*(x-1/9)^2));

hold on;
%axis([-2.3 2.3 0 1]);

[x, y] = xyLabb2(n);

P = interpVander(n);

count = 0;
for i = xe
    count = count + 1;
    ye(count) = P(i);
    %scatter(i, P(i), 'b');
end

yInt = interp1(x, y, xe);
ySpl = spline(x, y, xe);

%scatter(xe, yInt, 'g');
%scatter(xe, ySpl, 'r');

%fplot(f);

%RMSE felet
% Intervander
E1 = RMSE(n, ye, y);
%disp(['Intermange: ' num2str(E1)]);

%interp1
E2 = RMSE(n, yInt, y);
disp(['linjint: ' num2str(E2)]);

%spline
E3 = RMSE(n, ySpl, y);
disp(['styck^3:' num2str(E3)]);

hold off;


hold on;
grid on;

for i = 7:30
    pInt(i-6) = log(RMSE(i, yInt, y)/(RMSE(i-1, yInt, y)))/log((4/(i-1))/(4/(i-2)));
    pSpl(i-6) = log(RMSE(i, ySpl, y)/(RMSE(i-1, ySpl, y)))/log((4/(i-1))/(4/(i-2)));

end


for j = 1:length(pInt)
    disp(['p för int: ' num2str(pInt(j))]);
end
for j = 1:length(pSpl)
    disp(['p för spl: ' num2str(pSpl(j))]);
end

%loglog(h, abs(felV), '*');
%line(h, felV);



