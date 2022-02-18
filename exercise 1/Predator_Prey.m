
a1 = 0.0005;
a2 = 0.001;
e1 = 0.04;
e2 = 0.3;
x = 1:10000;
y = 1:10000;
x(1) =  50;
y(1) = 5;
dt = 0.1;
tail = 100;

exercise = 3; 

if exercise == 2
    for i = 2:10000
        [x(i), y(i)] = simStep(x(i-1),y(i-1),e1,a1,e2,a2,dt);
    end
    plot(x,y)
    hold on 
end
if exercise == 3
    trajectory = [x;y];
    plotTrajectory(trajectory, tail, 0.1    );
end




