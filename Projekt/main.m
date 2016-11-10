%startvinklar f�r x
startDeg = 25;
endDeg = 45;
xAng = startDeg:endDeg;
x = 0;
y = 0;
z = 1.4;
v = 25;

%kollar  de olika startvinklarna
for ang = xAng
    [x, y, xp, yp, zp] = poi(ang, x, y, z, v);
    %poi(ang);
    poiV(v-startDeg+1,1) = x;
    poiV(v-startDeg+1,2) = y;
end

%disp([' v      x        y    '])
%disp(['------------------------'])
%for i = xAng
%    disp([ num2str(i)  ' : ' num2str(poiV(i-startDeg +1, 1)) '  ' num2str(poiV(i-startDeg +1, 2))]);
%end

%Ber�knar utkastvinkeln f�r nedslag p� x-axeln
poiY = @(angle) spline(xAng, poiV(:, 2), angle);
impOnXaxis = fzero(poiY, 33);
%fplot(poiY, [25 45]);
disp(impOnXaxis);