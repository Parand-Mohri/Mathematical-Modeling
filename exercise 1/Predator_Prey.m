
a1 = 0.0005;
a2 = 0.001;
e1 = 0.04;
e2 = 0.3;
x = 1:1000;
y = 1:1000;
x(1) =  50;
y(1) = 5;
dt = 0.1;

exercise = 3; 

if exercise == 2
    for i = 2:1000
        [x(i), y(i)] = simStep(x(i-1),y(i-1),e1,a1,e2,a2,dt);
    end
    plot(x,y)
    hold on 
end

tail = 100;

