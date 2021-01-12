clc;
close all;
clear all;

prompt = 'What is the length of input vector: ';
lth=input(prompt);
t=ones(lth,1);
for i=1:lth
    prompt='';
    k=input(prompt);
    t(i)=k;
end
    
an=averg(t);
disp("The average is: ");
disp(an);

num=0;
for i=1:lth
    num=num+(t(i)-an)^2;
end

emp=num/(lth-1);
disp("The empirical variance is: ");
disp(emp);

function p= averg(x)
p=0;
for c=1:length(x)
    p=p+x(c);
end
p=p/length(x);
end