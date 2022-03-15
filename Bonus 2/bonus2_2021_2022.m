%% Bonus 2 MM 2021/2022 template
%  Don't put personal information here. It will be send for a plagiarism 
% check offsite 

%% Challenge 1a
% Given that a signal is sampled at 300Hz, design a notch filter to cancel
% out the 60Hz powerline interference and another notch filter to cancel 
% its 120Hz harmonic. Combine these in a single transfer function
fs=300;
t = 1 / fs;
omega1 = 0.4 * pi;
omega2 = 0.8 * pi;

% first make notch filter for 60Hz powerline
% z1 = [cos(omega1)+ 1i * sin(omega1) cos(-omega1) + 1i*sin(omega1) ];% zeros of notch filter 1
z1 = [exp(omega1*1i) exp(-omega1 * 1i)];
p1 = 0.95 * z1;% poles notch filter 1
b1 = poly(z1);% numerator polynomial notch filter 1
a1 = poly(p1);% denominator polynomial notch filter 1
sys2 = tf(b1, a1, t);
figure;
bode(sys2);

% then make notch filter for 120Hz harmonic
% z2 = [cos(omega2)+ 1i * sin(omega2) cos(-omega2) + 1i*sin(omega2) ];% zeros of notch filter 2
z2 = [exp(omega2 * 1i) exp(-omega2 * 1i)];
p2 = 0.95 * z2;% poles notch filter 2
b2 = poly(z2);% numerator polynomial notch filter 2
a2 = poly(p2); % denominator polynomial notch filter 2
sys3 = tf(b2,a2,t);
figure;
bode(sys3);

% Finally combine the notch filters in a single transfer function
z_c = [z1 z2];% zeros of combined transfer function
p_c = [p1 p2];% poles of combined transfer function
b_c = poly(z_c);% numerator of combined transfer function
a_c = poly(p_c);% denominator polynomial of combined transfer function
sys1  = tf(b_c,a_c, t);% Transfer function of combined system

%% Challenge 1b
% Plot the magnitude response (bode magnitude plot)
% first compute the frequency response
omega=linspace(0,2*pi,1000); % frequencies in radians
H2 = zeros(1,length(omega));%frequency response
for c = 1:length(omega)
    H2(c) = polyval(b_c, omega(c)) ./ polyval(a_c, omega(c));
end
% H2 = freqz(b_c,a_c,omega); %frequency response
% Plot the magnitude response (absolute value of the frequency response)
figure;
% plot(omega/2*pi,abs(H2));
bode(omega/2*pi,abs(H2));

xlabel('frequency (Hz)');
title('Magnitude response Task 2b')

% Make a pole-zero plot
figure;
% plot unit circle
tmpx=real(exp(omega*1i));
tmpy=imag(exp(omega*1i));
plot(tmpx,tmpy,'--k');
% plot real axis
hold on
plot(linspace(-1.1,1.1,100),zeros(1,100),'k:');
% plot imaginary axis
plot(zeros(1,100),linspace(-1.1,1.1,100),'k:');
plot(p_c, "x");% plot poles with an x
plot(z_c,"o");% plot zeros with an o
xlabel('real axis')
ylabel('imaginary axis')
axis square
title('Pole-zero plot Challenge 1b')

%% Challenge 1c
load data_MM_bonus2_challenge1.mat
figure;
subplot(3,1,1)
% do some plotting
plot((0:length(u)-1)*(fs/length(u)) , u);
title ('Time domain input');
xlabel('time (s)') % also make sure you actually have seconds that you show 
subplot(3,1,2)
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum
title('Magnitude spectrum input');
xlabel('write the meaning and units here')
subplot(3,1,3)
plot((0:length(u)-1)*(fs/length(u)),atan2(imag(fft(u)),real(fft(u)))*180/pi);
title('Phase spectrum input');
xlabel('write the meaning and units here')
ylabel('write the meaning and units here')  

%% Challenge 1d
figure;

plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum input
hold on
% find magnitude of tf and multiply but magnitude of input 
%https://lpsa.swarthmore.edu/Bode/BodeWhat.html#:~:text=To%20find%20the%20magnitude%20of,the%20transfer%20function%20(%CE%B8).
% bode(sys1, u);
bode(sys1)
hold off
% todo: magnitude spectrum output
title('Magnitude spectrum');
xlabel('write the meaning and units here')

%% Challenge 2
T = 0.01;% sampling interval
A=[-1 2 -3;-2 0 -1;2 1 -1]; % System matrix
B=[1; 0; -2]; % input matrix
C=[0 0 2]; % output matrix
D=0; % direct feedthrough

t=0:T:5-T; %create time vector
u=linspace(-1,1,length(t))+sin(2*t); % sampled time series

%% Challenge 2a
% M = zeros(length(A) + 1)
M = [A ,B; zeros([1, length(A)+1])];
% M = [A ; zeros([1, length(A)])]

e = exp( M * T);
si = e(1:length(A), 1:length(A));
phi = e(1: length(A),length(A)+1);
%% Challenge 2b
sysC = ss(A,B,C,D);
sysD = ss(A,B,C,D,T);
% lsim(sysC, u, t)
[yc,tc,xc] = lsim(sysC, u, t);
[yd,td,xd] = lsim(sysC, u, t);
