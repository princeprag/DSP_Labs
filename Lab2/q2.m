clc;
clear all;
close all;

x=[1,2,3,4,5]';
h=[1,1,1,1,1,1]';
N = length(x)+length(h)-1;  %the minimum pad factor
h1 = [h; zeros(N-length(h),1)];
x1 = [x ; zeros(N-length(x),1)];
out = ifft(fft(x1).*fft(h1));
yconv = conv(x,h);
subplot(2,1,1);
plot(out);
subplot(2,1,2);
plot(yconv);

% Two N-point DFT + One N-point inverse DFT = 3*(Nlog(N)/2)
% now product of two DFTs = N operations
% Total complex multiplications= 3*(Nlog(N)/2)+N
% so, total real multiplications= 4*(3*(Nlog(N)/2)+N)= 6Nlog(N)+4N
