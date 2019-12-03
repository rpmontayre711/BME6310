% Problem 1
%1.	Write a function that creates an n x n matrix A in which all the elements are 1.  Then, assign A to Anew such that:
clc;
clear;

n = 2;
[A,Anew] = newmatrices(n)


%Problem 2
%Plot the function
%f(x) = 3xcos2x – 2x \
%and its derivative, both on the same plot, for: 
%-2pi =< x =< 2pi
%Plot the function with a solid line and the derivative with a dashed line.
%Add a legend and label the axes

x = linspace(-2*pi, 2*pi, 200);
y = 3*x.*(cos(x)).^2 - 2*x;  %original fucntion

yprime = -6*x.*cos(x).*sin(x) + 3.*cos(x).^2 -2;  %1st derivative

figure;
plot(x,y,x,yprime,'--')
xlabel('-2pi to 2pi in Radians')
ylabel('Radians')
legend('Original Function','1st Derivative')

%Problem 3
%The area of the aortic valve, AV in cm2, can be estimated by the equation:
%Av = sqrt(Q/sqrt(P*G))
%where Q is the cardiac output in L/min, and PG is the difference between the left ventricular systolic pressure and the aortic systolic pressure (in mmHg).  
%Make one plot with two curves of Av versus PG, for 2  ? PG ? 60 mmHg.  One curve for Q = 4 L/min and the other for Q = 5 L/min.  Label the axes and use a legend.

Q1 = 4; %L/min
Q2 = 5; %L/min
PG = linspace(2,60,200); %mmHg

Av1 = Q1./sqrt(PG);
Av2 = Q2./sqrt(PG);

figure;
plot(PG,Av1,PG,Av2,'--')
xlabel('Aortic Systolic Pressure (mmHg)')
ylabel('Area of Aortic Valve (cm^2)')
legend('4 L/min', '5 L/min')
title('Relationship between Aortic Systolic Pressure and Aortic Valve Area with Variable Cardiac Output')


%Problem 4

%Have a min group and a max group to send numbers to
%Start with the first two numbers
%Decide which one is the min and max between the two
%Send the smaller number to the min group and larger to the max
%Pick the next two numbers and send to min and max group
%Compare newly grouped numbers to current min and current max
%Replace min and max as necessary


%Problem 5
%Write a Matlab function that does something of value to your lab.

%Finding Quantization Noise for Ultrasound


Vpeak = 5; %volts
bit = 8; %ADC bit

[delta,Vnoisequant] = RMSerror(Vpeak,bit)
