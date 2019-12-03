function [bisect_zero,NR_zero] = awesome_function(func,xlow,xhigh,tol_bisection,tol_NR)

% x_low is the lower bound of the zero
% x_high is the upper bound of the zero
% tol_bisection is the tolerance at which point you switch from the bisection to 
% the Newton-Raphson approach (as a percentage)
% tol_NR is the tolerance with Newton-Raphson method (as a percentage)
% @awesome_function is the handle to the function that you are trying to solve,
% NR_zero is the solution returned from the Newton-Raphson approach
% bisect_zero is the solution with the bisection method at which point you 
% switched to the Newton-Raphson method
% iters_bisection is the number of iterations you performed the bisection 
% method
% iters_NR is the number of iterations you performed the Newton-Raphson 
% method

if func(xlow)*func(xhigh)>0
    disp('choose again')
else
    xroot = (xlow+xhigh)/2;
    while err>tol_bisection && err<tol_NR
        if func(xlow)*func(xhigh)<0
            xhigh = xroot;
        else 
            xlow = xroot;
        end 
        bisect_zero = (xlow+xhigh)/2;
    end 
    while err > tol_NR
            [fx, fxderiv] = feval(func,xlow,xhigh);
        iters_NR = 10
        for i = 1:iters_NR
            NR_zero = x0 - fx/fxderiv;
            [fx, fxderiv] = feval(func,NR_zero);
             if (abs(NR_zero - x0) <=tol_NR) 
                break % Jump out of the for loop
             end
        x0 = NR_zero;
        end
    end
end 


