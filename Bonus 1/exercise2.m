R= 120.0; 
L= 0.01; 
C= 0.002;

A = [0 1; -1/(L*C) -R/L];
B = [1/L*C; 0];
C = [1 0];
D=0;
u = zeros(1000,1);
t = zeros(1000,1);
for dt = 1:1000
    t(dt) = dt/1000;%initializing time vector
end
u(:) = 50; % initializing input vector
sys = ss(A,B,C,D); % exercise 2a
lsim(sys,u, t) %exercise 2b


isstable(sys) % output is 1 so its stable - exercise 2c
%     [A,B,C,D] = ssdata(sys)

