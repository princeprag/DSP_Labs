clc;
close all;
clear all;
prompt='Please enter the length of pulse: ';
N=input(prompt);
prompt='Please enter the duty cycle: ';
d=input(prompt);
prompt='Please enter the number of periods: ';
M=input(prompt);

m=gateduty(N,d,M);

t=(1:(N*M))';
figure;
plot(t,m,'r')
title('Rectangular pulse with M periods');
xlabel('time in sec');
ylabel('pulse train (Amplitude)');

h=fft(m);

figure;
plot(abs(h));
title("Absolute value of FFT");


figure;
subplot(3,1,1);
lth=length(h);
p=h(1:length(h)/2+1);
p=(abs(p).^2)/(2*pi*length(p));
p(2:end-1)=2*p(2:end-1);
f=0:2*pi/lth:pi;
plot(f',p);
title('Power spectral Density using FFT');

[pxx,w]=periodogram(m);
subplot(3,1,2);
plot(w,pxx);
title('Power spectral Density using periodogram');

[pxx2,w2] = pwelch(m);
subplot(3,1,3);
plot(w2,pxx2);
title('Power spectral Density using pwelch');

subplot(2,1,1);
plot(w,20*log10(abs(pxx)));
title('Power spectral Density using periodogram (log scale)');

subplot(2,1,2);
plot(w2,20*log10(abs(pxx2)));
title('Power spectral Density using pwelch (log scale)');



function m=gateduty(N,d,M)
L=round((N*d)/100);
x=gatedutyy(N,d);
%x=[ones(L,1); zeros(N-L,1)];
m=[];
for p=1:M
    m=[m;x];
end
end

function x=gatedutyy(N,d)
L=round((N*d)/100);
x=[ones(L,1); zeros(N-L,1)];
end







