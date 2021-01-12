clc;
close all;
clear all;
prompt="Enter the value of N: ";
N=input(prompt);
sanpMean(N)

function p=sanpMean(N)
y=randn(N,1);
sum=0;
for c=1:N
    sum=sum+y(c);
end
p=sum/N;
end

