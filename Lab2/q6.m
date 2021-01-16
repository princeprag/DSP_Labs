clc;
clear all;
close all;
x=randi(10000000,1000,1);
L=50;
p=myquant(x,L);
figure();
stem(p);

function w=myquant(x,L)
N=min(x);
M=max(x);
sz=ceil((M-N+1)/L);
%r=zeros(size(x));
w=zeros(size(x));
levels=zeros(sz,1);
left=zeros(sz,1);
right=zeros(sz,1);
d=N;
for i=1:sz
    levels(i)=d+(L/2);
    right(i)=d+L;
    left(i)=d;
    d=d+L;
end

for j=1:length(x)
    fans=bsearch(left,x(j),L);
    if(fans==-1)
        disp(x(j));
    else
    w(j)=levels(fans);
    end
%     for i=1:sz
%         if(left(i)<=x(j) && x(j)<=right(i))
%             r(j)=levels(i);
%             break
%         end
%     end
end

end

function fans=bsearch(x,number,L)
l=1;
h=length(x);
fans=-1;
while (l<=h)
    mid=round((l+h)/2);
    if(x(mid)<=number && number<=x(mid)+L)
        fans=mid;
        break
    elseif ((x(mid)<=number && number>x(mid)+L))
        l=mid+1;
    else
        h=mid-1;
    end
        
end

end