clc;
clear all;
close all;

x=randi(50,50,1);
h=randi(100,50,1);
j=conv(x,h);

lth=max(length(x)+length(h)-1,max(length(x),length(h)));
h=[h;zeros(lth-length(h),1)];


aa=zeros(size(h));
for p=1:length(x)
    aa=aa+x(p)*h;
    l=h(end);
    h(2:end)=h(1:end-1);
    h(1)=l;
end



subplot(2,1,1);
plot(j);
title("Linear Convolution using inbuilt conv() function");
subplot(2,1,2);
plot(aa);
title("Linear Convolution");
