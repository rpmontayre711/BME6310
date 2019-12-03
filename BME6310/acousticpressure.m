function pinf = acousticpressure(t,x)
p0 = 10;  %hydrostatic pressure
pa = 2;   %pressure amplitude
k = 3;    %wavenumber
w = pi/180;   %angular frequency
pinf = p0 + pa*sin(k*x-w*t);