clc;
close all;
clear all;


subplot(3,1,1);
y=rand(10000,1);
h1=histogram(y,20);
title('Histogram of uniformly distributed elements by rand()');

y=randn(10000,1);
subplot(3,1,2);
h2=histogram(y,20);
title('Histogram of normally distributed elements by randn()');

y2=randi(10,10000,1);
subplot(3,1,3);
h3=histogram(y2,20);
title('Histogram of uniformly distributed integers by randi()');


