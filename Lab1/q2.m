%The hist function includes values falling on the right edge of each bin 
%(the first bin includes both edges), whereas histogram includes values that fall on the
%left edge of each bin (and the last bin includes both edges)

% The rand function generates arrays of random numbers whose elements are uniformly distributed in the interval ( 0 , 1 )
clc;
close all;
clear all;

y=rand(10000,1);

subplot(4,1,1);
h1=histogram(y,20);
title('Histogram of uniformly distributed elements by rand()');
%counts=h1.Values;
%edges=h1.BinEdges;

x=(0:0.11:1);
subplot(4,1,2);
y2=histogram(x,10);
title('Histogram of uniformly distributed elements');

y1=unifpdf(x,0,1);
subplot(4,1,3);
h2=histogram(y1,20);
title('Histogram of uniform pdf in (0,1)');

subplot(4,1,4);
plot(x,y1);
title('uniform pdf in (0,1)');