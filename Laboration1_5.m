%A = [1 -1 3;
%    1 0 0;
%    1 0 5;
%    1 3 0;
%    1 4 6;
%    1 5 1];

xlim([-10, 10]);
ylim([-10, 10]);
grid;

[x,y] = ginput(8);

A = [1 1 1 1 1 1 1 1; 
    x';
    y']';

b = x.^2 + y.^2;

x = A\b;
c1 = x(1);
c2 = x(2);
c3 = x(3);
r = sqrt(c1 + (c2/2)^2 + (c3/2)^2);
Teta = 0:0.01:2*pi;
xp = r*cos(Teta);
yp = r*sin(Teta);

for i= 1:6;
   plot(A(i+8), A(i+16), 'ro'); 
   hold on;
end

plot(c2/2 + xp, c3/2 + yp);

xlim([-10, 10]);
ylim([-10, 10]);
