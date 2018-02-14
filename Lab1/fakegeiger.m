clc; close all; clear all;
tau=5;

N=1000;

tc=linspace(0,15,31);

t=-tau*log(rand(N,1));

g=transpose(histc(t,tc));

M=[tc(1:30)',g(1:30)'];

dlmwrite('geigerdata.txt',M,'newline','pc')

plot(tc(1:30),g(1:30),'o')

