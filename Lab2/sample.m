close all;
% filename = 'rec.mp3';
% [y,Fs] = audioread(filename);
% y=y(:,1);
% x = y(110000:120000)';
% plot of real sound signal

x=fir1(15,0.3,'high');
figure('Name','Time Domain Signal','NumberTitle','off')
plot(x,'r-'), legend({'Firm Door'},'Location','best')
xlabel('t \rightarrow');
ylabel('x(t) \rightarrow');
%sound(x);
[N,M] = size(x)

%DTFT and its plot
sepration = .001 % sepration betweeen 2point in frequency domain
X_w = DTFT(x,sepration);
[m,n] = size(X_w);
zz=0:sepration:2*pi;
figure('Name','DTFT using Naive approach','NumberTitle','off')
plot(zz,abs(X_w),'g-'),legend({'DTFT'},'Location','best');
xlabel('0 < \omega < 2*\pi \rightarrow');
ylabel('|X(\omega)| \rightarrow');

% DFT using naive approach and its plot
X = DFT(x);
figure('Name','DFT using Niave approach','NumberTitle','off')
plot(1:M,abs(X),'b-'),legend({'DFT'},'Location','best');
xlabel('k \rightarrow');
ylabel('|X(k)| \rightarrow');

%DFT using fft algorithm and its plot
figure('Name','DFT using fft inbuilt algorithm','NumberTitle','off')
plot(1:M,abs(fft(x)),'c-'),legend({'DFT'},'Location','best');
xlabel('k \rightarrow');
ylabel('|X(k)| \rightarrow');

% will return dft of x
function [X] = DFT(x)
[N,M] = size(x)

F = zeros(1,M);
for n = 0:M-1
F(n+1) = exp(-j*2*pi*n/M);
end

X = zeros(1,M); %%% same dimension as the input vector 
for k=0:M-1
X(k+1) = x*(F'.^k); % matrix .Operator will operate element wise on matrix
end
end


%DTFT function
function [X] = DTFT(x,sepration)
[M,N] = size(x);
w = -pi:sepration:pi;
[m,n] = size(w);

F = zeros(1,N);
for i = 0:N-1
F(i+1) = exp(-1*j*i);
end

X = zeros(1,n);
for k = 0:n-1
X(k+1) = x*(F'.^w(k+1)); %x is 1*N , F' is N*1 
end
end