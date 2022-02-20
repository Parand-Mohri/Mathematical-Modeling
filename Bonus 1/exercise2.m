R= 120.0; % Ohms
L= 0.01; % Henrys
C= 0.002;

A = [0 1; -1/(L*C) -R/L];
B = [1/L*C; 0];
C = [1 0];
D=0;
u = zeros(1000,1);
t = zeros(1000,1);
for dt = 1:1000
    t(dt) = dt/1000;
end
u(:) = 50;
sys = ss(A,B,C,D);
lsim(sys,u, t)
isstable(sys)
%     [A,B,C,D] = ssdata(sys)
%     [xextsm
%     plot(ssdata(sys), )
%     sys_dc(A)
% end
