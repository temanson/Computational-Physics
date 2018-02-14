%--------------- Rocket Lab ------------------
%--------------- A3-8 rocket------------------
%--------------- Date:2/1/18------------------
%---------------------------------------------

clc; clear all; close all;

%--------- Initializing Variables ------------
mpA0 = 0.00312;
mpC0 = 0.01248;
mrA = (52-26.9+16.2-3.12)/1000;
mrC = (52-12.48)/1000;

Cd = 0.73;
densityAIR = 1.26;
cross_area = pi*(0.0249/2)^2 + 3*(0.0444)*(0.002);
c2 = 0.5*Cd*1.26*cross_area;

N = 7000;
t1 = 220;
t2 = 300;
t3 = 650;
t4 = 720;

dt = 1;
t(1) = 0;
f(1) = 0;
IA(1) = 0;
IC(1) = 0;
mpA(1) = mpA0;
mpC(1) = mpC0;
mtotA(1) = mpA(1) + mrA;
mtotC(1) = mpC(1) + mrC;
vA(1) = 0;
yA(1) = 0;
aA(1) = -9.8;

vC(1) = 0;
yC(1) = 0;
aC(1) = -9.8;

liftoff = false;


%-------- Making piece-wise function of A8-3 thrust curve ---------- 
for i = 2:N+1
    t(i) = t(i-1) + dt;
    %--------------- Piece-wise thrust curve --------------
    if t(i) < t1
        f(i) = t(i)*(10/t1);
        
    elseif t(i) < t2 && t(i) >= t1
        f(i) = 10 + ((2.5-10)/(t2-t1))*(t(i)-t1);
        
    elseif t(i) < t3 && t(i) >= t2
        f(i) = 2.5;
        
    elseif t(i) < t4 && t(i) >= t3
        f(i) = 2.5 + ((0-2.5)/(t4-t3))*(t(i)-t3);
    else
        f(i) = 0;
    end
    
end

g(1) = 0;
gt1 = 190;
gt2 = 350;
gt3 = 1810;
gt4 = 1830;

%-------- Making piece-wise function of C6-7 thrust curve ---------- 
for i = 2:N+1
    %--------------- Piece-wise thrust curve --------------
    if t(i) < gt1
        g(i) = t(i)*(14/gt1);
        
    elseif t(i) < gt2 && t(i) >= gt1
        g(i) = 14 + ((4-14)/(gt2-gt1))*(t(i)-gt1);
        
    elseif t(i) < gt3 && t(i) >= gt2
        g(i) = 4;
        
    elseif t(i) < gt4 && t(i) >= gt3
        g(i) = 4 + ((0-4)/(gt4-gt3))*(t(i)-gt3);
    else
        g(i) = 0;
    end
    
end

g = g.*(10/8.6);


%------------ Calculating total impulse --------
for i = 2:N+1
    t(i) = t(i-1) + dt;
    IA(i) = dt/1000*f(i); 
    IC(i) = dt/1000*g(i);
end

IAtot = sum(IA);
ICtot = sum(IC);

%------------------- Part 1. --------------------------
figure(1)
plot(t,f)
hold on
plot(t,g)
grid on 
legend('A8-3','C6-7')
title('Thrust vs. Time')
xlabel('Time (msec)')
ylabel('Thrust (N)')
descr = {'Total Impulse: A8-3 = '};
descr0 = {' C6-7 = '};
text(2500,6,strcat(descr , num2str(IAtot) , descr0 , num2str(ICtot)))


%------------ mass of propellant ---------------
for i = 2:N+1
    
    mpA(i) = mpA(i-1) - f(i)/IAtot*mpA0*dt/1000;
    mpC(i) = mpC(i-1) - g(i)/ICtot*mpC0*dt/1000;
    
end


%------------- Part 2. ---------------------
figure(2)
plot(t,mpA)
hold on 
plot(t,mpC)
grid on 
legend('A8-3','C6-7')
title('Propellant Mass vs. Time')
xlabel('Time (msec)')
ylabel('Propellant Mass (kg)')


%------------------ Euler's Method -----------------------
for i = 2:N+1
    
    t(i) = t(i-1) + dt;
    vA(i) = vA(i-1) + aA(i-1)*dt/1000;
    yA(i) = yA(i-1) + vA(i-1)*dt/1000;
    mtotA(i) = mrA + mpA(i);
   % a(i) = a(1) - c2/mtotA(i)*v(i)^2 + f(i)/mtotA(i);
    dragA(i) = c2*vA(i)^2;
    
    if aA(i-1) < 0 && liftoff == false
        aA(i) = aA(1) - c2/mtotA(i)*vA(i)^2 + f(i)/mtotA(i);
    else
        liftoff = true;
        aA(i) = aA(1) - c2/mtotA(i)*vA(i)^2 + f(i)/mtotA(i);
    end
	
%-----------------------------------------------------------
	
	vC(i) = vC(i-1) + aC(i-1)*dt/1000;
    yC(i) = yC(i-1) + vC(i-1)*dt/1000;
    mtotC(i) = mrC + mpC(i);
   % a(i) = a(1) - c2/mtotA(i)*v(i)^2 + f(i)/mtotA(i);
    dragC(i) = c2*vC(i)^2;
    
    if aC(i-1) < 0 && liftoff == false
        aC(i) = aC(1) - c2/mtotC(i)*vA(i)^2 + g(i)/mtotC(i);
    else
        liftoff = true;
        aC(i) = aC(1) - c2/mtotC(i)*vC(i)^2 + g(i)/mtotC(i);
    end
	
end

%--------- read A8-3.txt for experimental data -------------

experimentaldata = dlmread('A8-3.txt');
tdata = experimentaldata(:,1).*1000;
displacement = experimentaldata(:,2);

maxYA = num2str(max(yA));
maxYC = num2str(max(yC));


%-------------------- Part 3. -----------------------
figure(3)
plot(t,yA)
hold on 
plot(tdata,displacement,'o')
grid on 
title('A3-8 Height vs. Time')
legend('Simulation','Experiment')
xlabel('Time (msec)')
ylabel('Height (m)')
descr1 = {'Maximum Height A8-3 = '};
text(3000,20,strcat(descr1,maxYA))


maxVC = num2str(max(vC));
maxAC = num2str(max(aC));
maxDragC = num2str(max(dragC));

%--------------------- Part 4. -----------------------

figure(4)
subplot(2,2,1)
plot(t,yC)
title('C6-7 Height vs. Time')
grid on
xlabel('Time (msec)')
ylabel('Height (m)')
descr2 = {'Maximum Height: C6-7 = '};
text(4000,100,strcat(descr2,maxYC))

subplot(2,2,2)
plot(t,vC)
title('C6-7 Velocity vs. Time')
grid on
xlabel('Time (msec)')
ylabel('Velocity (m/s)')
descr3= {'Maximum Velocity: C6-7 = '};
text(3000,80,strcat(descr3,maxVC))

subplot(2,2,3)
plot(t,aC)
title('C6-7 Acceleration vs. Time')
grid on
xlabel('Time (msec)')
ylabel('Acceleration (m/s^2)')
descr4 = {'Maximum Acceleration: C6-7 = '};
text(2000,200,strcat(descr4,maxAC))

subplot(2,2,4)
plot(t,dragC)
title('C6-7 Drag vs. Time')
grid on
xlabel('Time (msec)')
ylabel('Drag (N)')
descr5 = {'Maximum Drag Force: C6-7 = '};
text(3000,3,strcat(descr5,maxDragC))