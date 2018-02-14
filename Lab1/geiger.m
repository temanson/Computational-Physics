%--------------------------------------
%----- Author: Eli Temanson  ----------
%----- Date: 1/30/2018       ----------
%----- Half-life from Gieger ----------
%--------------------------------------

clc; close all;

%------load data from geigerdata.txt----
geigerdata = dlmread('geigerdata.txt');

%------find the size of geigerdata------
M = size(geigerdata);

%------create two column arrays---------
t = geigerdata(:,1);
R = geigerdata(:,2); 

%------create an array of the ln(R)-----
LnR = log(R);
figure(1)
plot(t,LnR,'ro')
hold on

%------find slope and intercept-----------
%sum_t = sum(t);
%sum_t2 = sum(t.^2);
%sum_R = sum(LnR);
%sum_R2 = sum(LnR.^2);
%sum_tR = sum(t.*LnR);

sum_t = 0;
sum_t2 = 0;
sum_R = 0;
sum_R2 = 0;
sum_tR = 0;

for n = 1:30
       sum_t = sum_t + t(n);
       sum_t2 = sum_t2 + (t(n))^2;
       sum_R = sum_R + LnR(n);
       sum_R2 = sum_R2 + (LnR(n))^2;
       sum_tR = sum_tR + LnR(n)*t(n);
end

%-----Finding slope and y-intercept for Linear fit---
b = ((sum_t2*sum_R)-(sum_t*sum_tR))/(30*sum_t2-(sum_t)^2);
a = (30*sum_tR-sum_t*sum_R)/(30*sum_t2-(sum_t)^2);

%-----Setting new array-Y as linear fit------
y = a.*t+b;

%-----Plotting solution----------------------
plot(t,y)
title('Log(Rate) vs. Time(min)')
xlabel('Time(min)')
ylabel('Log(Rate)')
legend('Experimental Data','Method of least square line ')

%-----Finding and plotting half-life------
r0 = exp(b)
tao = -1/a
expected_R = r0*exp(-t./tao);
figure(2)
plot(t,R,'o')
hold on
plot(expected_R)
hold on

%-------Find uncertainty---------------
sxx = sum(t.^2);
sx = sum(t);
yaxb = 0;
for i=1:30
  yaxb = yaxb + (y(i)-a*t(i)-b)^2;
end
S = sqrt(yaxb/(n-2));
delta_a = S*sqrt(n/(n*sxx-sx^2))
delta_b = S*sqrt(sxx/(n*sxx-sx^2))

partial_R0 = 0;
partial_tao = 0;
for i = 1:30
  partial_R0 = partial_R0 + exp(-t(i)/tao);
  partial_tao = partial_tao -r0/tao*exp(-t(i)/tao);
end
delta_R = sqrt(partial_R0.^2 + partial_tao.^2)

plot(expected_R - (delta_R-200))
hold on 
plot(expected_R + (delta_R-200))
title('Rate vs. Time(min)')
xlabel('Time(min)')
ylabel('Rate')
legend('Experimental Data','Expected Exponential ','Error','Error')


