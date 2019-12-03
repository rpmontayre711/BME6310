function [dydt] = computeDYDT(t,y)

dydt = (-1/999)*exp(-1000*t) + (1000/999)*exp(-1*t);;     % t=0,  y=0