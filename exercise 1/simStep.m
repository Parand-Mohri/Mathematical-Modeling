function [x,y] = simStep(x,y,e1,a1,e2,a2,dt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(nargin<7)
    dt=1;
end
dx = (e1 * x) - (a1 * x * y);
dy = (- e2 * y) + (a2 * x * y);
x = x + (dt * dx);
y = y + (dt * dy);
end

