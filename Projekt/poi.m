function [ xZero, yZero, xpZero, ypZero, zpZero ] = poi( angXDeg, x0, y0, z0, v0 )
%POI (Point of Imoact)
%   Calculates the point of impact depeding of the degree between the
%   x-axis and the throw trajectory

    %Konstanter
    angZ = 30*(pi/180);  %Utkastvinkel vertikalt (radianer)
    angX = -angXDeg*(pi/180);   %Sökta vinkeln (radianer)

    t = 0:0.1:2.2;

    %Beräknar startvärde
    Y0 = startValue(angX, angZ, x0, y0, z0, v0);

    %Beräknar bollbanan
    trajDots = trajectory(t, Y0);
    %disp(trajDots);
    
    k = yPrimZero(trajDots(:, 5));
    %disp(['k: ' num2str(k)])

    %Interpolerar bollbanan i z(x), z(y), z(x'), z(y') och z(z')
    xInterp = @(x) spline(trajDots(k:end, 1), trajDots(k:end, 3), x);
    %fplot(xInterp, [0 20]);
    yInterp = @(y) spline(trajDots(k:end, 2), trajDots(k:end, 3), y);
    %fplot(yInterp, [0 20]);
    xpInterp = @(xp) spline(trajDots(k:end, 4), trajDots(k:end, 3), xp);
    %fplot(xpInterp, [0 20]);
    ypInterp = @(yp) spline(trajDots(k:end, 5), trajDots(k:end, 3), yp);
    %fplot(ypInterp, [-10 10]);
    zpInterp = @(zp) spline(trajDots(k:end, 6), trajDots(k:end, 3), zp);
    %fplot(zpInterp, [0 20]);
    
    
    %Hitta nollställen för z(x) och z(y), z(x'), z(y') och z(z')
    xZero = fzero(xInterp, (trajDots(k, 1)+trajDots(end, 1))/2);
    yZero = fzero(yInterp, (trajDots(k, 2)+trajDots(end, 2))/2);
    xpZero = fzero(xpInterp, (trajDots(k, 4)+trajDots(end, 4))/2);
    ypZero = fzero(ypInterp, (trajDots(k, 5)+trajDots(end, 5))/2);
    zpZero = fzero(zpInterp, (trajDots(k, 6)+trajDots(end, 6))/2);
    %disp(['xp: ' num2str(xpZero)]);
    %disp(['yp: ' num2str(ypZero)]);
    %disp(['zp: ' num2str(zpZero)]);
    %-angXDeg/(45/2)
    
    

    
    hold on
    grid on
    %scatter(trajDots(:, 1), trajDots(:, 3));
    zlabel('z');
    xlabel('x');
    ylabel('y');
    plot3(trajDots(:, 1), trajDots(:, 2), trajDots(:, 3), 'color', [252/255, 120/255, 12/255]);

end

