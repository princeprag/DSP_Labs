clc;
clear all;
close all;

x=randi(50,50,1);
h=randi(100,50,1);
j=conv(x,h);

M=length(x);
N=length(h);
lth=M+N-1;
h=[h;zeros(lth-N,1)];


aa=zeros(size(h));
for p=1:M
    aa=aa+x(p)*h;
    l=h(end);
    h(2:end)=h(1:end-1);
    h(1)=l;
end

%%total number of multiplications M*(M+N-1)



subplot(2,1,1);
plot(j);
title("Linear Convolution using inbuilt conv() function");
subplot(2,1,2);
plot(aa);
title("Linear Convolution");
