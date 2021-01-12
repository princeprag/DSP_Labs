clc;
close all;
clear all;
delta=0.20;
a=0.50;
x=rand(1,100);

t=steperr(x,a,delta);
disp(t);



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

