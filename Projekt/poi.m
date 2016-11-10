function [ xZero, yZero, xpZero, ypZero, zpZero ] = poi( angXDeg, x0, y0, z0, v0 )
%POI (Point of Imoact)
%   Calculates the point of impact depeding of the degree between the
%   x-axis and the throw trajectory

    %Konstanter
    angZ = 30*(pi/180);  %Utkastvinkel vertikalt (radianer)
    angX = -angXDeg*(pi/180);   %Sökta vinkeln (radianer)

    t = x0:0.1:x0+2;

    %Beräknar startvärde
    Y0 = startValue(angX, angZ, x0, y0, z0, v0);

    %Beräknar bollbanan
    trajDots = trajectory(t, Y0);
    disp(trajDots);

    %Interpolerar bollbanan i z(x), z(y), z(x'), z(y') och z(z')
    xInterp = @(x) spline(trajDots(10:end, 1), trajDots(10:end, 3), x);
    %fplot(xInterp, [0 20]);
    yInterp = @(y) spline(trajDots(10:end, 2), trajDots(10:end, 3), y);
    %fplot(yInterp, [0 20]);
    xpInterp = @(xp) spline(trajDots(10:end, 4), trajDots(10:end, 3), xp);
    %fplot(xpInterp, [0 20]);
    ypInterp = @(yp) spline(trajDots(10:end, 5), trajDots(10:end, 3), yp);
    %fplot(ypInterp, [-10 10]);
    zpInterp = @(zp) spline(trajDots(10:end, 6), trajDots(10:end, 3), zp);
    %fplot(zpInterp, [0 20]);
    
    %Hitta nollställen för z(x) och z(y), z(x'), z(y') och z(z')
    xZero = fzero(xInterp, 18);
    yZero = fzero(yInterp, -1);
    zZero = 0;
    xpZero = fzero(xpInterp, 8);
    ypZero = fzero(ypInterp, 4);
    zpZero = fzero(zpInterp, 0);
    disp(['xp: ' num2str(xpZero)]);
    disp(['yp: ' num2str(ypZero)]);
    disp(['zp: ' num2str(zpZero)]);
    %-angXDeg/(45/2)
    
    

    
    %hold on
    %grid on
    %scatter(trajDots(:, 1), trajDots(:, 3));
    %zlabel('z');
    %xlabel('x');
    %ylabel('y');
    %plot3(trajDots(:, 1), trajDots(:, 2), trajDots(:, 3));

end

