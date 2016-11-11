ang = 0;
x = 0;
y = 0;
z = 1.4;
v = 25;

view(0, 0);
poi(ang, x, y, z, v);

view(0, 90);
poi(ang, x, y, z, v);

view(-60, 30);
%patch([25 0 0 25], [20 20 -10 -10], [0 0 0 0], [20 20 -20 -20], 'FaceColor', 'green', 'FaceAlpha', .4)
poi(ang, x, y, z, v);

