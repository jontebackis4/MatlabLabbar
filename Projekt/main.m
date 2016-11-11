%startvinklar för x
startDeg = 25;
endDeg = 45;
xAng = startDeg:endDeg;
x = 0;
y = 0;
z = 1.4;
v = 25;

%kollar  de olika startvinklarna
for ang = xAng
    [xI, yI, xpI, ypI, zpI] = poi(ang, x, y, z, v);
    %poi(ang);
    poiV(ang-startDeg+1,1) = xI;
    poiV(ang-startDeg+1,2) = yI;
end

%disp([' v      x        y    '])
%disp(['------------------------'])
%for i = xAng
%    disp([ num2str(i)  ' : ' num2str(poiV(i-startDeg +1, 1)) '  ' num2str(poiV(i-startDeg +1, 2))]);
%end

%Beräknar utkastvinkeln för nedslag på x-axeln
grid on;
hold on;
poiY = @(angle) spline(xAng, poiV(:, 2), angle);
impOnXaxis = fzero(poiY, 33);
%fplot(poiY, [25 45]);
%disp(impOnXaxis);

trajBounce(impOnXaxis, x, y, z, v);
