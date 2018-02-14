%-------------------------------------------------------
%--------------- Radioactive Lifetime   ----------------
%--------------- By: Eli Temanson       ----------------
%--------------- A+B->C w/ rate R1 & R2 ----------------
%-------------------------------------------------------

clc; clear all; close all;

%-------------------- Variables ------------------------

R1 = 1;
R2 = 1;  %rate ->  dA/dt = -RA or dB/dt = +RA
dt = 0.001;
A(1) = 1;
B(1) = 0.8;
C(1) = 0;
N = 3000;
t(1) = 0;
%-------------------------------------------------------

for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - C(i-1)*dt*R2;
    
end

p = [R1/R2, -((R1/R2)*(A(1)+C(1)+B(1)+C(1))+1), R1/R2*((A(1)+C(1))*(B(1)+C(1)))];
r = roots(p);

Cf = r(2);
Af = A(1) + C(1) - Cf;
Bf = B(1) + C(1) - Cf;
Aeq = Af*ones(1,N+1);
Beq = Bf*ones(1,N+1);
Ceq = Cf*ones(1,N+1);

figure(1)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,Aeq,'--b','LineWidth',2)
hold on 
plot(t,Beq,'--r','LineWidth',2)
hold on 
plot(t,Ceq,'--g','LineWidth',2)
hold on 
grid on
legend('A','B','C','Aeq','Beq','Ceq')
text(1,0.98,strcat('R1/R2 = ',num2str(R1/R2)))
text(1,0.93,strcat('Af = ', num2str(Af)))
text(1,0.88,strcat('Bf = ', num2str(Bf)))
text(1,0.83,strcat('Cf = ', num2str(Cf)))
title('Reaction2c')
xlabel('Time [sec]')
ylabel('Concentration [mols/L]')

%--------------------------------------------------------------
R1 = 1;
R2 = 10;
for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - C(i-1)*dt*R2;
    
end

p = [R1/R2, -((R1/R2)*(A(1)+C(1)+B(1)+C(1))+1), R1/R2*((A(1)+C(1))*(B(1)+C(1)))];
r = roots(p);

Cf = r(2);
Af = A(1) + C(1) - Cf;
Bf = B(1) + C(1) - Cf;
Aeq = Af*ones(1,N+1);
Beq = Bf*ones(1,N+1);
Ceq = Cf*ones(1,N+1);

figure(2)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,Aeq,'--b','LineWidth',2)
hold on 
plot(t,Beq,'--r','LineWidth',2)
hold on 
plot(t,Ceq,'--g','LineWidth',2)
hold on 
grid on
legend('A','B','C','Aeq','Beq','Ceq')
text(1,0.6,strcat('R1/R2 = ',num2str(R1/R2)))
text(1,0.55,strcat('Af = ', num2str(Af)))
text(1,0.5,strcat('Bf = ', num2str(Bf)))
text(1,0.45,strcat('Cf = ', num2str(Cf)))
title('Reaction2c')
xlabel('Time [sec]')
ylabel('Concentration [mols/L]')

%--------------------------------------------------------------
R1 = 10;
R2 = 1;
for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    A(i) = A(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    B(i) = B(i-1) - A(i-1)*B(i-1)*dt*R1 + C(i-1)*dt*R2;
    C(i) = C(i-1) + A(i-1)*B(i-1)*dt*R1 - C(i-1)*dt*R2;
    
end

p = [R1/R2, -((R1/R2)*(A(1)+C(1)+B(1)+C(1))+1), R1/R2*((A(1)+C(1))*(B(1)+C(1)))];
r = roots(p);

Cf = r(2);
Af = A(1) + C(1) - Cf;
Bf = B(1) + C(1) - Cf;
Aeq = Af*ones(1,N+1);
Beq = Bf*ones(1,N+1);
Ceq = Cf*ones(1,N+1);

figure(3)
plot(t,A,'LineWidth',2)
hold on 
plot(t,B,'LineWidth',2)
hold on 
plot(t,C,'g','LineWidth',2)
hold on 
plot(t,Aeq,'--b','LineWidth',2)
hold on 
plot(t,Beq,'--r','LineWidth',2)
hold on 
plot(t,Ceq,'--g','LineWidth',2)
hold on 
grid on
legend('A','B','C','Aeq','Beq','Ceq')
text(1,0.98,strcat('R1/R2 = ',num2str(R1/R2)))
text(1,0.93,strcat('Af = ', num2str(Af)))
text(1,0.88,strcat('Bf = ', num2str(Bf)))
text(1,0.83,strcat('Cf = ', num2str(Cf)))
title('Reaction2c')
xlabel('Time [sec]')
ylabel('Concentration [mols/L]')







