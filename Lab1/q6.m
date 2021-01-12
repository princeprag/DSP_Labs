clc;
close all;
clear all;
prompt='Please enter the length of pulse: ';
N=input(prompt);
prompt='Please enter the duty cycle: ';
d=input(prompt);

p=gatedutyy(N,d);
t=1:N;
figure;
plot(t,p,'b')
title('Rectangular pulse');
xlabel('time (in sec)');
ylabel('pulse train (Amplitude)');


function x=gatedutyy(N,d)
L=round((N*d)/100);
x=[ones(L,1); zeros(N-L,1)];
end







