clc
close all;
clear all;
delta = zeros(3,1);
prob = zeros(3,1);
j=1;
for i=1:3
    delta(i,1)=j/10;
    j=j/10;
end

promt = input('enter number of values of x: ');
x=zeros(promt,1);

N = input('enter value of N: ');

for i=1:promt
    x(i,1)=sampmean(N);
end

for i=1:3
    sum =0;
    k=steperr(x,0,delta(i,1));
    for j=1:promt
        if k(j,1)==1
            sum = sum +1;
        end
    end
    prob(i,1)=sum/promt;
end
n = 1:3;
stem(delta,prob);

function y=steperr(x,a,delta)
    y=zeros(size(x));
    for c=1:length(x)
        if abs(x(c)-a)<delta
            y(c)=0;
        else
            y(c)=1;
        end    
    end
end

function m = sampmean(x)
    m=0;
    a=randn(x,1);
    for i=1:x
        m=m+a(i,1);
    end
    m=m/x;   
end