% implementation of ODE45 solver
% 
y0 = [2];
xspan = [0 15];
[x,y] = ode45(@example_dydx,xspan,y0);
figure(1); plot(x,y(:,1)); xlabel ('x'); ylabel('y');


% simple system of ODEs
x0 = [4 6];
tspan = [0 4];
[t,x] = ode45(@computeDXDT_simple_system,tspan,x0);
figure(4); plot(t,x(:,1),'k*',t,x(:,2),'b.'); 
xlabel ('X'); ylabel('Y*');
legend('y1','y2')

