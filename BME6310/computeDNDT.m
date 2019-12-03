function [dNdt] = computeDNDT(t,N)

R = 0.55;    %days^-1

C = 10e4;    %carrying capacity of local environment
Nc = 10e4;   %Critical size
r = 10e4;    %1/day  maximum value that second term can reach at large values of N


dNdt = R*N*(1-(N/C)) - (r*N)^2 / (Nc^2 + N^2);


