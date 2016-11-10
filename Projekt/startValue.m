function [ Y ] = startValue( angX, angZ, x, y, z, v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    xp = v*cos(angZ)*cos(angX);
    yp = v*cos(angZ)*sin(angX);
    zp = v*sin(angZ);
    
    Y = [x; y; z; xp; yp; zp];
    
end

