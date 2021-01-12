   %%Time specifications:
   clc;
   clear all;
   close all;
   prompt = 'What is the Fs value? ';
   Fs = input(prompt);
   prompt = 'What is the Frequency value? ';
   Fc = input(prompt);
   dt = 1/Fs;                   
   StopTime = 1;               
   t = (0:dt:StopTime);      
   
   x = cos(2*pi*Fc*t);
   % Plot the signal versus time:
   subplot(2,1,1);
   plot(t,x);
   xlabel('time (in seconds)');
   ylabel('Amplitude');
   title('Signal versus Time');
   zoom  xon;
   
   subplot(2,1,2);
   stem(t,x);
   xlabel('time (in seconds)');
   ylabel('Amplitude');
   title('Signal versus Time (individual samples)');
   zoom  xon;