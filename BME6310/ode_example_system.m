
% simple system of ODEs
%x0 = [15 0];
tspan = [0 10];

x = [168 286];
y = [10 20];
xI = 200;
yI = interp1(x,y,xI);

x0 = [40 yI];

[t,x] = ode45(@computeDXDT_simple_system,tspan,x0);
figure(4); plot(t,x(:,1),'k*',t,x(:,2),'b.'); 
xlabel ('t'); ylabel('X*');
legend('x1','x2')

