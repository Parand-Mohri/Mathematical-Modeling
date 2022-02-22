
%(0, 0) / x' = 0  /   y' = -5 --> NOT equilibrium
%(1, 2)  / x ' = 0 /  y' = 0  --> equilibrium 
%(2, 1)  / x ' = 0 / y' = 0 --> equilibrium 
syms x y
derX = @(x, y) 2*x - 3*x*y + y ^ 2;
derY = @(x, y) x + y + x*y - 5;
x0 = 1; 
y0 = 2;

% jocobian 
J(x,y) = jacobian([2*x - 3*x*y + y ^ 2, x + y + x*y - 5],[x,y]);    
% initial two points around x0 and y0 
xHat = x - x0; 
yHat = y - y0;
% linearisation around (x0,y0)
derHat =  J(x0,y0) * [xHat;yHat]
derXHat = derHat(1);
derYHat =  derHat(2);

