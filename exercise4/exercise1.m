A = [4 1 0; -7 -1 -1; 119 32 -8];
B = [0;0;1];
C = [227 55 -13];
D = -2;
[b,a,S] = Fadeev(A,B,C,D);
sys = ss(A,B,C,D);
[r,p,k] = residue(b,a);
input = @(t) sin(4 * t);
t = (0:0.1:10); 
u = input(t); 
lsim(sys,u, t);
hold on
plot(t,u)