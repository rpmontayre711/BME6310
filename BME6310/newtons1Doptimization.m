function newtons1Doptimization(func, x0, tolx)
% Newton’s method is used to minimize an objective function of a single% variable
% Input variables% func :first and second derivative of nonlinear function
% x0 : initial guessed value
% tolx : tolerance in estimating the minimum
% Other variables
maxloops = 20;

[df, ddf] = feval(func,x0);
fprintf('i x(i) f’’(x(i)) f’’’’(x(i)) \n');  %\n is carriage return

% Minimization scheme
for i = 1:maxloops
    x1 = x0 - df/ddf;
    [df, ddf] = feval(func,x1);
    fprintf('%2d %7.6f %7.6f %7.6f \n',i,x1,df,ddf);
    if (abs(x1 - x0) <= tolx)
        break
    end 
    x0 = x1;
end