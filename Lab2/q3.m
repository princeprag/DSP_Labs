clc;
clear all;
close all;
prompt="Please give the value of T: ";
T=input(prompt);
m=[];
k=[1; zeros(T-1,1)];
for j=1:1000
    m=[m;k];
end
stem(1:1000*T,m);
zoom xon;
