clc;
close all;
clear all;
x=inputT();
prompt="Enter the value of a: ";
a=input(prompt);
MSE(x,a)


function p=MSE(x,a)
lth=length(x);
sum=0;
for k=1:lth
    sum=sum+(x(k)-a)^2;   
end
p=sum/lth;
end

function t=inputT()

prompt = 'What is the length of input vector: ';
lth=input(prompt);
t=zeros(lth,1);
for i=1:lth
    prompt='';
    k=input(prompt);
    t(i)=k;
end
end
