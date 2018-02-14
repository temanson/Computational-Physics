clc; close all; clear all;

% time and temp data
tdata = [0:2:46];
tempdata0 = [82.3,78.5,74.3,70.7,67.6,65.0,62.5,60.1,58.1,56.1,54.3,52.8,...
    51.2,49.9,48.6,47.2,46.1,45.0,43.9,43.0,41.9,41.0,40.1,39.5];

tempdata1=dlmread('coolingdata.txt');

plot(tdata,tempdata0,'bo')
hold on
plot(tdata,tempdata1,'r+')
%set(plot(tdata,tempdata,'o'),'LineWidth',9)   %plot data

N = 1000;   
dt = 46/N;  % time step

t(1) = 0;
T0(1) = tempdata0(1);
T1(1) = tempdata0(1);
T2(1) = tempdata0(1);
Tr = 17;    % Room Temp

r0 = 0.024; % deg/min
r1 = 0.03;
r2 = 0.02;
for i = 2:N
    t(i) = t(i-1) + dt;
    T0(i) = T0(i-1) - r0*(T0(i-1)-Tr)*dt;
    T1(i) = T1(i-1) - r1*(T1(i-1)-Tr)*dt;
    T2(i) = T2(i-1) - r2*(T2(i-1)-Tr)*dt;
end

hold on
ph1 = plot(t,T0,t,T1,t,T2);
%set(ph1,'LineWidth',9)

title('Coffee Cooling Example','fontsize',20)
xlabel('Time (mins) ','fontsize',20)
ylabel('Temp Celsius ','fontsize',20)
legend('Temperature Data','r0 = 0.024','r1 = 0.03','r2 = 0.02')
%set(gca,'linewidth',5,'fontsize',25)

