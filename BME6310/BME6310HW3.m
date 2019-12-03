%% BME 6310 HW 5

% 1)

tspan = 0:5:50;  %days
R = 0.55;    %days^-1
N0 = 10e3;   %number of mosquitos
Nc = 10e4;   %Critical size
r = 10e4;    %1/day  maximum value that second term can reach at large values of N





dNdt = R*N*(1-(N/C)) - (r*N)^2 / (Nc^2 + N^2);