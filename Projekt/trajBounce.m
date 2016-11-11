function [  ] = trajBounce( utkastvinkel, x, y, z, v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    Y0 = startValue(-utkastvinkel*(pi/180), 30*(pi/180), 0, 0, 1.4, 25);
   
    t = 0:0.1:2;
    s0 = trajectory(t, Y0); %första kastet
    
    [xI, yI, xpI, ypI, zpI] = poi(utkastvinkel, x, y, z, v);
    i = 1;
    while s0(i, 3)>0
        kastbana(i, 1) = s0(i, 1);
        kastbana(i, 2) = s0(i, 2);
        kastbana(i, 3) = s0(i, 3);
        i = i+1;
    end
    
    kastbana(i, 1) = xI;
    kastbana(i, 2) = yI;
    kastbana(i, 3) = 0;
    
    plot3(kastbana(:, 1), kastbana(:, 2), kastbana(:, 3));
    
    Y0 = [xI, 0, 0, xpI, ypI, -0.8*zpI];
    
end

