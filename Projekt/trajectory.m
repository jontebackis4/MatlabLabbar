function [ Y ] = trajectory( t, Y0 )
%UNTITLED3 Summary of this function goes here
%   pos = [x, y, z]
%   velo = [xp, yp, zp]

    c = 0.070;

    a = @(z) 7+0.35*z;   %Vindstyrkan (m/s)
    q = @(Y) c*sqrt( Y(4)^2 + (Y(5) - a(Y(3)))^2 + Y(6)^2 );
    
    F = @(t, Y) [Y(4); Y(5); Y(6); -q(Y)*Y(4); -q(Y)*(Y(5)-a(Y(3))); -9.82-q(Y)*Y(6)];
    
    
    [trash, Y] = ode45(F, t, Y0);
    
end

