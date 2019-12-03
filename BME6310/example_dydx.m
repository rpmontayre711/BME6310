function [dydx] = example_dydx(x,y)

dydx = x*sin(y) +y*sin(x);
