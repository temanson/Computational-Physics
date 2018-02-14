%-------------------------------------------------------
%--------------- Radioactive Lifetime   ----------------
%--------------- By: Eli Temanson       ----------------
%--------------- A+B->C w/ rate R1      ----------------
%--------------- A+C->D w/ rate R2      ----------------
%-------------------------------------------------------

clc; clear all; close all;

%-------------------- Variables ------------------------

R1 = 1;
R2 = 1;  %rate ->  dA/dt = -RA or dB/dt = +RA
dt = 0.001;
A(1) = 1;
B(1) = 0.8;
C(1) = 0;
D(1) = 0;
N = 10000;
t(1) = 0;
%-------------------------------------------------------

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1- A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(1)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(4,0.9,strcat('R1/R2 = ',num2str(R1/R2)))
text(4,0.85,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(4,0.8,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(4,0.75,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(4,0.7,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

%--------------------------------------------------------------

R1 = 1;
R2 = 10;

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2 ;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(2)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(4,0.98,strcat('R1/R2 = ',num2str(R1/R2)))
text(4,0.93,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(4,0.88,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(4,0.83,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(4,0.78,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

%------------------------------------------------------------

R1 = 10;
R2 = 1;

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2 ;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(3)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(4,0.5,strcat('R1/R2 = ',num2str(R1/R2)))
text(4,0.45,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(4,0.4,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(4,0.35,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(4,0.3,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

A(1) = 1;
B(1) = 0.8;
C(1) = 0;
D(1) = 0;

%-------------------------------------------------------
%-------------------------------------------------------
%-------------------------------------------------------

%-------------------- Variables ------------------------

R1 = 1;
R2 = 1;  %rate ->  dA/dt = -RA or dB/dt = +RA
A(1) = 1;
B(1) = 0.5;
C(1) = 0;
D(1) = 0;
%-------------------------------------------------------

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2 ;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(4)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(4,0.9,strcat('R1/R2 = ',num2str(R1/R2)))
text(4,0.85,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(4,0.8,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(4,0.75,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(4,0.7,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

%--------------------------------------------------------------

A(1) = 0.5;
B(1) = 1;
C(1) = 0;
D(1) = 0;

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2 ;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(5)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(4,0.98,strcat('R1/R2 = ',num2str(R1/R2)))
text(4,0.93,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(4,0.88,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(4,0.83,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(4,0.78,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

%------------------------------------------------------------

A(1) = 1;
B(1) = 0.3;
C(1) = 0.3;
D(1) = 0;

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2 ;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - A(i-1)*C(i-1)*dt*R2;
    D(i) = D(i-1) + A(i-1)*C(i-1)*dt*R2;
    
end
 
figure(6)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,D,'c','LineWidth',2)
hold on 
grid on
legend('A','B','C','D')
text(1.5,0.9,strcat('R1/R2 = ',num2str(R1/R2)))
text(1.5,0.85,strcat('A0 = ', num2str(A(1)),' mol/L'))
text(1.5,0.8,strcat('B0 = ', num2str(B(1)),' mol/L'))
text(1.5,0.75,strcat('C0 = ', num2str(C(1)),' mol/L'))
text(1.5,0.7,strcat('D0 = ', num2str(D(1)),' mol/L'))
title('Reaction3')
xlabel('Time [sec]')
ylabel('Concentration [mol/L]')

