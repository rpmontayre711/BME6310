function [df ddf] =flowrateoptimization(Q)
% Calculates thefirst and second derivatives of the profit function
ain = 10e-6;  % feed concentration of A (kmol/m^3)
p = 400;     % price in US dollars per kg of product
%c = 15;      % operating cost per kg of product
c = getGlobalc; 
k = 2;        % forward rate constant (1/hr)
V = 12;       % fermentor volume (m^3)
rho = 2.5;    % density (kg/m^3)
MWB = 70000;  % molecular weight (kg/kmol)

df = 8000*(p - c)*ain*MWB*(1 - 1/(1 + k*V/Q) - Q*k*V/(Q + k*V)^2) - 0.6*4000*(8000*rho)^0.6/(Q^0.4);
    
ddf = 8000*(p - c)*ain*MWB*(-2*(k*V)^2/(Q + k*V)^3) +    0.24*4000* (8000*rho)^0.6/(Q^1.4);
end