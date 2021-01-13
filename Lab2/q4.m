clc;
clear all;
close all;
h=[1,2,3,4];


for p=1:4
    x=ImpTrain(p);
    y=conv(x,h);
    figure();
    subplot(2,1,1);
    stem(x);
    subplot(2,1,2);
    stem(y);
end

function m=ImpTrain(T)
m=[];
k=[1; zeros(T-1,1)];
for j=1:10
    m=[m;k];
end
end