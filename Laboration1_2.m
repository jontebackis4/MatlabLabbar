tol = input('tol = ');
i1 = 1;
i2 = 2;
sum1 = 1;
sum2 = sum1 +(1/(i2^2));
while tol < abs(sum1 - sum2)
    
    i1 = i2;
    i2 = i2+1;
    sum1 = sum2;
    sum2 = sum2 + (1/(i2^2));
end

disp(['summan är: ' num2str(sum2)]);