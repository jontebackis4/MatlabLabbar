
n = input('n: ');

[P Q] = approxSqrt2(n);

absErr = abs((Q(end)/P(end)) - sqrt(2));

disp(absErr)

