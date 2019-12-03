function [dxdt] = computeDXDT_simple_system(~,x)

dxdt(1) = x(1);
dxdt(2) = 0.01*(x(1)-20);

dxdt = [dxdt(1); dxdt(2)];