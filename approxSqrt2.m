function [ P Q ] = approxSqrt2( n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

Pn_1 = 0;
Pn = 1;
Qn = Pn + Pn_1;

P = [Pn];
Q = [Qn];

for i = 2:n

    temp = Pn;
    Pn = 2*Pn + Pn_1;
    Pn_1 = temp;
    Qn = Pn + Pn_1;

    P = [P Pn];
    Q = [Q Qn];
end

end

