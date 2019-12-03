%% BME 6310 HW 5

% 1) 

tspan = [0 50];  %days
R = 0.55;    %days^-1
C = 10e4;    %carrying capacity of local environment
Nc = 10e4;   %Critical size
r = 10e4;    %1/day  maximum value that second term can reach at large values of N
N0 = 10e4; 

% = R*N*(1-(N/C)) - (r*N)^2 / (Nc^2 + N^2


[t,N] = ode15s(@computeDNDT,tspan,N0);

figure
plot(t,N)

%% 2)

clear all
tspan = [0 10];
xblood = (200e9)/(2*2.2);

%x0 = [0 xblood];
x0 = 0;
[t,x] = ode45(@computedXdt,tspan,x0);

figure
plot(t,x)


%%   3)

J = [1 10; 7 -8];   %Jacobian

%from jacobian calculate eigen values by hand
lambda1 = 6;
lambda2 = -13;

%these fit into (lambda^2 + 7*lambda-78)

%for this case, the eigen values are positive and negative and contain no
%imaginary components, meaning we will have a saddle point

%insert picture of online applet


%% 4)

%7.6 from textbook   page 478
%Eq 7.27  & 7.28
%example 7.2  page 427

% a = 30; %um radius
% ps = 1.2;  %g/cm^3
% T = 20; %deg C
% pair = 1.206e-3; %g/cm^3   (no humidity)
% uair = 0.0175; %cP


[t,y] = eulerforwardmethodvectorized('settlingsphere',0.001,[0;0],0.001);
figure
subplot(2,1,1)
plot(t,y(1,:))
title('Displacement with Step size of 0.001')
xlabel('t(s)')
ylabel('z(um)')
subplot(2,1,2)
plot(t,y(2,:))
title('Velocity with Step size of 0.001')
xlabel('t(s)')
ylabel('v(um/s)')


[t,y] = eulerforwardmethodvectorized('settlingsphere',0.001,[0;0],0.00001);
figure
subplot(2,1,1)
plot(t,y(1,:))
title('Displacement with Step size of 0.000001')
xlabel('t(s)')
ylabel('z(um)')
subplot(2,1,2)
plot(t,y(2,:))
title('Velocity with Step size of 0.000001')
xlabel('t(s)')
ylabel('v(um/s)')

[t,y] = ode15s(@settlingsphere,[0 0.001],[0;0]);
figure
subplot(2,1,1)
plot(t,y(:,1))
title('Displacement with Step size of 0.000001')
xlabel('t(s)')
ylabel('z(um)')
subplot(2,1,2)
plot(t,y(:,2))
title('Velocity with Step size of 0.000001')
xlabel('t(s)')
ylabel('v(um/s)')
%% 5) Problem from lab

%looking at microbubble dynamics for ultrasound
%microbubble common contrast agent for ultrasound and has properties when
%acoustically disrupted

%Measure the acoustic pressure when parallel to wall (in x)

tspan = [0 200]
x0 = 0;

[t,x] = ode45(@acousticpressure,tspan,x0);

figure
plot(t,x)




