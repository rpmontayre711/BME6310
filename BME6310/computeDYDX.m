function [dydx] = computeDYDX(x,y)

dydx = 4*exp(0.8*x) - 0.5*y;