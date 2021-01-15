clc;
clear all;
close all;

a=audiorecorder(8000,8,1);
disp('Start speaking.....');
recordblocking(a,2);
disp('End of Recording.....');

data=getaudiodata(a);
f=fir1(15,0.3,'low')';


figure();
ft=fft(data);
subplot(3,1,1);
plot(abs(ft));
title("FFT of the input sample");


ft1=fft(f);
subplot(3,1,2);
plot(abs(ft1));
title("FFT of the filter coefficients");

%%%%%%%%%%% part a %%%%%%%%%%%%%%
y=conv(data,f);

%%%%%%%%%%%% part b%%%%%%%%%%%%%%%%%%%% 
[out,res]=convfft(data,f);
subplot(3,1,3);
plot(abs(res));
title("fft of the convoluted signal");



figure();
subplot(4,1,1);
plot(data);
title("The original speech signal");

subplot(4,1,2);
plot(y);
title("resultant after passing using direct linear convolution");

subplot(4,1,3);
plot(out);
title("resultant after passing using fft");

%%%%%%%%%%% part c %%%%%%%%%%%%%%
bs=[64,128,256,512];
figure();
for y=1:4
f_oa=overlapAdd(bs(y),data,f);
subplot(4,1,y);
plot(f_oa);
title("Overlap-add method using block length "+bs(y));
end






%%%%%%%%%%% part d %%%%%%%%%%%%%%
bs=[64,128,256,512];
figure();
for y=1:4
f_os=overlapSave(bs(y),data,f);
subplot(4,1,y);
plot(f_os);
title("Overlap-Save method using block length "+bs(y));
end




%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%
function ff=overlapAdd(ss,data,f)
M=length(data);
N=length(f);
rql=M+N-1;
ff=zeros(rql,1);
lth=ceil(M/ss); 
for p=1:lth
    ed=0;
    if p*ss>M
        ed=M;
    else
        ed=p*ss;
    end
    x1=data((p-1)*ss+1:ed); %%%taking samples of given stepsize
    [out,res]=convfft(x1,f); %%%taking convolution
    out1=[zeros(ss*(p-1),1);out]; %%%shifting 
    out2=[out1;zeros(rql-length(out1),1)];  %%%padding 0's to end to make of final size
    ff=ff+out2;
end
end


function ff=overlapSave(ss,data,f)
M=length(data);
N=length(f);         %%%%%%%%%% we will be taking N-1 previous data points/zeros 
                     %%% with each block  of size ss
rql=M+N+N-1-1;
ff=zeros(rql,1);
lth=ceil(M/ss); 
for p=1:lth
    ed=0;
    if p*ss>M
        ed=M;
    else
        ed=p*ss;
    end
    x1=data((p-1)*ss+1:ed); %%%taking samples of given stepsize size=ss
    
    if (p==1)
        x1=[zeros(N-1,1);x1]; %%%% padding with either 0's at beginning or M-1
                              %previous data points
    else
        
        x1=[data((p-1)*ss-N+2:(p-1)*ss);x1];
    end
    
    size= ss+N-1;
    
    
    [out,res]=convfft(x1,f); %%%taking convolution size=ss+N-1+N-1
    out=[zeros(N-1,1);out(N:end)]; %%%% discarding the first N-1 points
    out1=[zeros(ss*(p-1),1);out]; %%%shifting 
    out2=[out1;zeros(rql-length(out1),1)];  %%%padding 0's to end to make of final size
    
    
    
    ff=ff+out2;
end
ff=ff(1:end-N+1);
end


function [out,res]=convfft(data,f)
N1 = length(data)+length(f)-1;  %the minimum pad factor
h1 = [data; zeros(N1-length(data),1)];
f1 = [f ; zeros(N1-length(f),1)];
res=fft(h1).*fft(f1);
out = ifft(res);
end


