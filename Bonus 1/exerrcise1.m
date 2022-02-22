
%(0, 0) / x' = 0  /   y' = -5 --> false 
%(1, 2)  / x ' = 0 /  y' = 0  --> true 
%(2, 1)  / x ' = 0 / y' = 0 --> true 
syms x y
derX = @(x, y) 2*x - 3*x*y + y ^ 2;
derY = @(x, y) x + y + x*y - 5;
x0 = 1; 
y0 = 2;

% jocobian 
J(x,y) = jacobian([2*x - 3*x*y + y ^ 2, x + y + x*y - 5],[x,y]);
J(x0,y0)
x1 = x0 + 0.0001;
y1 = y0 + 0.0001;
der =  J(x0,y0) * [x1;y1];
derX1 = der(1);
derY1 =  der(2);

