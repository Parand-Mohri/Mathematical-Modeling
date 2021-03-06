%we have sampled signal of 300Hz 
%%we have two cascade filters one at 60Hz at the other at the harmonic of
%%120 Hz
%%2*pi === sampling frequency. 0Hz == 0rad, hence 60Hz corersponds to 
%%(60 * 2*pi ) / 300 = 0.4 pi 
%%and for the second filter: (120* 2* pi) /300 = 0.8 pi 
%%THESE CORRESPOND TO THE ZEROS OF THE TRANSFER FUNCTION, SINCE WE WANT IT
%%TO BE ZERO AT THIS FREQ 

%poles should be between origin and the zeros, we should slightly shift them  
%assignment says 95% from poles 
%find their respective transfer functions 

fs =  300; 
% first make notch filter for 60Hz powerline
z1 = [exp(0.4*pi*1i), exp(-0.4*pi*1i)];
p1 = [0.95*exp(0.4*pi*1i), 0.95*exp(-0.4*pi*1i)];
b1 = poly(z1);
a1 = poly(p1);
sys1 = tf(b1, a1, 1/fs);
%figure;
%bode(sys1), grid on;
%title("Notch filter at 60Hz");

%%second filter t 120HZ

z2 = [exp(0.8*pi*1i), exp(-0.8*pi*1i)];
p2 = [0.95*exp(0.8*pi*1i), 0.95*exp(-0.8*pi*1i)];
b2 = poly(z2);

a2 = poly(p2); 
sys2 = tf(b2, a2, 1/fs);
% figure;
% bode(sys2), grid on ;
% title("notch filter at 120Hz");

%combination of both 
z3 = [z1 z2]; 
p3 = [p1 p2]; 
b3 = poly(z3);
a3 = poly(p3); 
sys3 = tf(b3, a3, 1/fs); 

% figure;
% bode(sys3), grid on;
% title("both notch filters together"); 

%%are the zeros on the unit circle? (do the module on the imaginary and
%%real part) Given that they only have imaginary part( the redius = 1) 
% and we represent them in the polar form, we can induce taht all our zeros
% are in the unit circle


%% obtained transfer function 
 
%   1.000 *z^4 + 1.0000 *z^3 + 1.0000*z^2 + 1.0000*z + 1.0000
%  --------------------------------------------------------------
%  1.000*z^4 + 0.9500 z^3 + 0.9025 z^2 + 0.8574 z + 0.8145


%% Challenge
% 1b
% Plot the magnitude response (bode magnitude plot)

% first compute the frequency response
omega=linspace(0,2*pi,1000); % frequencies in radians with 1000 data points
H = zeros(size(omega));
for i=1: length(omega)
    H(i)= polyval(b3, omega(i)) / polyval(a3, omega(i));
end
%h = freqz(b3, a3, omega); %frequency response
figure;
plot(omega/2*pi, abs(H))  %giving that omega = 2pi*f we need tp divide by 2pi when plotting
% Plot the magnitude response (absolute value of the frequency response)
xlabel('frequency (Hz)');
title('Magnitude response Challenge 1b')

%bode(omega/(2*pi), abs(H2))  %giving that omega = 2pi*f we need tp divide by 2pi when plotting



% Make a pole-zero plot
figure;

% plot unit circle
tmpx=real(exp(omega*1i));
tmpy=imag(exp(omega*1i));
plot(tmpx,tmpy,'--k');
% plot real axis
hold on
plot(linspace(-1.1,1.1,100),zeros(1,100),'k:')
% plot imaginary axis
plot(zeros(1,100),linspace(-1.1,1.1,100),'k:')
% plot poles with an x
plot(real(p3), imag(p3), 'o')
plot(real(z3), imag(z3), 'x')
% plot zeros with an o
xlabel('real axis')
ylabel('imaginary axis')
axis square
title('Pole-zero plot Challenge 1b')


%% Challenge 1c

data = load("data_MM_bonus2_challenge1.mat");
figure;
subplot(3,1,1)
plot(data.u);
title ('Time domain inout');
xlabel('time (s)') % also make sure you actually have seconds that you show 
subplot(3,1,2)
plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum
title('Magnitude spectrum input');

%%TODODOOO
xlabel('')
subplot(3,1,3)
% todo: add the phase spectum
%getting our phase; use atan2 tp avoid computation errors
%using the fourier transformation from the database and retrieving the rea
phase = atan2(imag(fft(u)), real(fft(u)))*180/pi; %its in degrees

%linspace(0,2*pi,1000)
% plot(linspace(0,fs,1000), phase)
title('Phase spectrum input');
xlabel('frequency (Hz)')
ylabel('angle')

%% Challenge 1d
figure;
% plot((0:length(u)-1)*(fs/length(u)),abs(fft(u))); % magnitude spectrum input
% hold on
output  = zeros(1,1000);
input =abs( fft(u));
for i = 1:1000
    output(i)= polyval(b3, input(i)) / polyval(a3, input(i));
end
% plot((0:length(u)-1)*(fs/length(u)),abs(input));
% hold on
plot((0:length(u)-1)*(fs/length(u)),abs(fft(output)));
% legend({'y = sin(x)','y = cos(x)'},'Location','southwest')
% hold off
% todo: magnitude spectrum output
title('Magnitude spectrum');
xlabel('write the meaning and units here')

T=0.01; % sampling interval
A=[-1 2 -3;-2 0 -1;2 1 -1]; % System matrix
B=[1; 0; -2]; % input matrix
C=[0 0 2]; % output matrix
D=0; % direct feedthrough
t=0:T:5-T; %create time vector
u=linspace(-1,1,length(t))+sin(2*t); % sampled time series

y= lsim(sys, u, T);

 