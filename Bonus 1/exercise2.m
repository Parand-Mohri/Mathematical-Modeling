R= 120.0; 
L= 0.01; 
C= 0.002;

A = [0 1; -1/(L*C) -R/L];
B = [1/L*C; 0];
C = [1 0];
D=0;

frequ = 50; % frequency 
a = 1; % amplitude 
input = @(t) a * sin(frequ * t); % input function
t = (0:0.001:1); 
u = input(t); 

sys = ss(A,B,C,D); % exercise 2a
y=lsim(sys,u, t); % exercise 2b
plot(t,y)
% exercise 2c:
% all the eigenvalues of A are negative so its stable system 
eig(A)


