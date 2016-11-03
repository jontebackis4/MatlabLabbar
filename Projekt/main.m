
%Konstanter
c = 0.070;
v0 = 25;
angZ = 30;  %Utkastvinkel vertikalt (grader)
angX = 0;   %Sökta vinkeln (grader)

t = 0:1/2:25;

pos0 = [0, 0, 1.4];
velo0 = [25*cos(30)];

bana = trajectory(pos0, velo0, t); 


