ang = 0;
x = 0;
y = 0;
z = 1.4;
v = 25;

view(0, 0);
poi(ang, x, y, z, v);

view(0, 90);
poi(ang, x, y, z, v);

view(-70, 15);
%patch([20 0 0 20],  [15 15 0 0], [0 0 0 0], [15 15 -20 -20], 'FaceColor', 'blue', 'FaceAlpha', .4)
poi(ang, x, y, z, v);

view(-90, 0);
poi(ang, x, y, z, v);