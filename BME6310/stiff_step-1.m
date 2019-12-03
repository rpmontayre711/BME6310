% analytical solution
figure(1); hold on;
for t = 0:.05:4
   y = (-1/999)*exp(-1000*t) + (1000/999)*exp(-1*t);
   plot(t,y,'-bx')
end

% explicit euler
clear
tic
figure(2); hold on;
y_i = 0;
%h = .0001; %0.002 or 0.01
h = 0.002;
for t = 0:h:4
    dydt = y_i* (-1/999)*exp(-1000*t) + (1000/999)*exp(-1*t);
    y_i_plus_1 = y_i + dydt*h;
    plot(t,y_i_plus_1, 'rx:');
    y_i = y_i_plus_1;
end
toc

% stiff example and two solvers
clear
tic
y0 = [0; 0];
tspan = [0 100];
[t,y] = ode45(@computeDYDT,tspan,y0);
figure(2); 
plot(t,y(:,1),'bx')
toc

clear
tic
y0 = [0];
tspan = [0 100];
[t,y] = ode15s(@computeDYDT,tspan,y0);
figure(3); 
plot(t,y(:,1),'bx')
toc


% implicit euler
clear
tic
figure(3); hold on;
y_i = 0;
h = .01;
for t = 0:h:4
    y_i_plus_1 = (y_i + 3000*h - 2000*h*exp(-(t+h)) ) / (1 + 1000*h);
    plot(t,y_i_plus_1, 'r.:');
    y_i = y_i_plus_1;
end
toc

