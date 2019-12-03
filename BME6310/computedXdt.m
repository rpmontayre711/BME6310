function [dXdt] = computedXdt(t,x)

k = 2.2;
dXdt(1) = x(1);
for i = 1:9
    dXdt(i+1) = 2*k*x(i-1) - k*x(i);

end
xblood = (200e9)/(2*2.2);
dXdt(10) = dXdt(10) - xblood;
dXdt = [dXdt(1); dXdt(2); dXdt(3); dXdt(4); dXdt(5); dXdt(6); dXdt(7); dXdt(8); dXdt(9); dXdt(10)]

end
