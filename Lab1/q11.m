clc 
close all;
clear all;

x=zeros(100,1);
for i=1:100
    t=zeros(10000,1);
    for j=1:10000
        t(j,1)=sampmean(i);
    end
    x(i,1)=MSE(t,0);
end

n=1:100;
subplot(2,1,1);
plot(n,x);
xlabel("N\rightarrow");
ylabel("Mean squared Error");
title("Linear Scale");
subplot(2,1,2);
plot(n,20*log10(x));
xlabel("N\rightarrow");
ylabel("Mean squared Error");
title("Log Scale");

function m = sampmean(x)
    m=0;
    a=randn(x,1);
    for i=1:x
        m=m+a(i,1);
    end
    m=m/x;   
end

function p=MSE(x,a)
    lth=length(x);
    sum=0;
    for k=1:lth
        sum=sum+(x(k)-a)^2;   
    end
    p=sum/lth;
end