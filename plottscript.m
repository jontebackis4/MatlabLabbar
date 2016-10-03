

errTrp = [0.018582, 4.6431e-3, 0.0011606, 0.00029013];
errSim = [1.8703e-05, 3.2565e-06, 2.681e-07, 1.7722e-08];
n = [11, 21, 41, 81];
h = [1/2, 1/4, 1/8, 1/16];

hold on;
grid on;

c = polyfit(h, errTrp, 1);
disp(c(1));

loglog(h, errTrp, '*');
line(h, errTrp);
for i = 2:4
    pTrp(i-1) = log(errTrp(i)/errTrp(i-1))/log(h(i)/h(i-1));
    pSim(i-1) = log(errSim(i)/errSim(i-1))/log(h(i)/h(i-1));
end
disp(pTrp);
disp(pSim);