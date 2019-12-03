%% BME6310 HW3

%1)
clear
syms x1 x2
f =@(x1,x2) x1.^2 + 2*x2.^2 - x1 - 6*x2;
x1_0 = 0;
x2_0 = 0;
dfdx1 = @(x1,x2) 2*x1 -1 + 0*x2;
dfdx2 = @(x1,x2) 4*x2 -6 + 0*x1;
s1 = -dfdx1(x1_0,x2_0);
s2 = -dfdx2(x1_0,x2_0);

x1d = @(d) x1_0 +d*s1;
x2d = @(d) x2_0 +d*s2;
fd = @(d) f(x1d(d),x2d(d));

d_star = fminsearch(fd,0)

x1_1 = x1d(d_star);
x2_1 = x2d(d_star);
s1 = -dfdx1(x1_1,x2_1);
s2 = -dfdx2(x1_1,x2_1);

x1d = @(d) x1_1 +d*s1
x2d = @(d) x2_1 +d*s1

fd = @(d) f(x1d(d),x2d(d));

d_star = fminsearch(fd,0)




%% 2
%Answer above in assignment document for formatting purposes

%% 3

%f = 2*x1 + 3*x2 + x3

%x1 + x2 + x3 <= 4.8;
%10*x1 + x3 <= 9.9;
%x2-x3 <= 0.2

f = [2 3 1];
A = [1 1 1
    10 0 1
    0 1 -1];
b = [4.8 9.9 0.2];

Aeq = [];
beq = [];


[x,f] = linprog(-f,A,b,Aeq,beq)   %outputs x1,x2,x3 for maximum f within constraints


%now observe f as 1st constraint inequality changes <= 1 through 10

for i = 1:10
    X = fprintf('Change first constraint to be <= %d \n ',i );
    disp(X)
    f = [2 3 1];
    A = [1 1 1
    10 0 1
    0 1 -1];
    b = [i 9.9 0.2];

    Aeq = [];
    beq = [];


    [x,f] = linprog(-f,A,b,Aeq,beq)   %outputs x1,x2,x3 for maximum f within constraints
end
%% 4
%Example 8.2A (p. 489) 
%write script that wraps around both functions and varies fermentation 
%parameters. Interpret significance of results


%change variable c and observe changes
%c is  operating cost per kg of product
global c
for j = 10:5:35
 setGlobalc(j);   
 
 X = fprintf('Cost per kg of produce is $ %d \n',c);
 disp(X)
newtons1Doptimization('flowrateoptimization',50,0.01)
end 

%As can be seen by the result,as the cost is increased by increments of 5, the rate at which
%the profit decreases is about 30 per cost increase increment of 5.

%% 5 
mu = 1; %micro g/sec-micro m
b = 1; %micro m
a0 = 1.5; %inital guess
%f = [];
dfdx = [];
d2fdx2 = [];
%f(1) = (4*pi*mu*a0)/(log((2*a0)/b) -0.5);
dfdx(1) = (8*pi*(2*log((2*a0)/b)-3))/((2*log((2*a0)/b)-1)^2);
d2fdx2(1) = -1*(16*pi*(2*log((2*a0)/b)-5))/((a0*(2*log((2*a0)/b)-1))^3);
a = zeros(4);
a(1) =  a0;

for i = 1:3
    %f =  (4*pi*mu*a(i))/(log((2*a(i))/b) -0.5);
    dfdx(i+1) =  (8*pi*(2*log((2*a(i))/b)-3))/((2*log((2*a(i))/b)-1)^2);
    d2fdx2(i+1) = -1*(16*pi*(2*log((2*a(i))/b)-5))/((a(i)*(2*log((2*a(i))/b)-1))^3);
    a(i+1) = a(i) - dfdx(i)/d2fdx2(i); 
end 

fprintf('alpha values %d \n', a(:,1))

%% 6
%p. 538
%eq 2.27   p. 104


%a)  
%S1 = HbO2(n)/(HbO2 + Hb);
%S2 = ((pO2)^n)/(pn50^n +pO2^n);
pO2 = [0.18 0.4 0.65 0.8 0.87 0.92 0.94 0.95 0.95 0.96 0.96 0.97];
S = 10:10:120;
%pn50 = (pO2.^n) ./ (S) - (pO2).^n;
fun = @(n,pn50) n*log(pO2) - n* log(pn50)- log(S./(1-S));
m = length(pO2);
avg_S = mean(S);
avg_pO2 = mean(pO2);
a1 = ( m*sum(pO2.*S) - sum(pO2)*sum(S) ) / ( m*sum(pO2.^2) - (sum(pO2))^2 )
a0 = avg_S - a1*avg_pO2

X = fminsearch(@(n) fun(pO2,S), [0.5 0.5])
Y = fminsearch(@(pn50) fun(pO2,S), [0.2 0.4])

%b)
X1 = [ones(size(pO2))' pO2' S'];
b = regress(S',X1); % also removes NaN data

figure;
scatter3(pO2,S,m,'filled'); hold on;
pO2fit = min(pO2):0.1:max(pO2);
Sfit = min(S):0.1:max(S);
[pO2FIT,SFIT] = meshgrid(pO2fit,Sfit);
nFIT = b(1) + b(2)*pO2FIT + b(3)*SFIT;
mesh(pO2FIT,SFIT,nFIT)

pn50FIT = b(1) + b(2)*pO2FIT + b(3)*SFIT;
mesh(pO2FIT,SFIT,pn50FIT)







%% 7 

%In ultrasound images there is a need to find the maximum values of an
%image to then normalize the rest of the image to that value.

%Estimate some random sinusoid to simulate a input signal

  %x changes frequency, y changes amplitude
  syms x y
simsignal= @(x,y) sin(x)*y+ x.^2;
y = 30;
[xmax,fval] = fminsearch(@(x) -1.*simsignal(x,y),4);   %use -1 * function to turn fminsearch into a 
                                       %function to search for maximum
x = xmax;
normalized_signal = simsignal(x,y)./xmax                                       

