%Homework 2
%1	Write a Matlab function [x] = yourlastname_Gauss (A, b) that implements Gaussian elimination to solve a system of equations by performing a forward sweep and a back substitution.  A is an n x n matrix and b is a solution vector such that Ax=b. Make sure you check for the possibility of a zero in the pivot element and subsequently make the appropriate change to your system so that the problem can still be solved.  Assume that A has full rank and you only have one solution to Ax=b.  Be sure to demonstrate that your function works for an example (theoretical) problem.  

%A is a full rank matrix, so A is nxn matrix and rank is n
%b is solution vector
%Equations are as follows
%2x+3y+7z  = 29
%3x-2y-14z = -43
%x+4y+2z   = 15

A = [2 3 7; 3 -2 -14; 1 4 2];
b = [29;-43;15];
[x] = Montayre_Gauss(A,b)
%check answers
xcheck = inv(A)*b

%2.	Find a biomedical engineering problem of interest that involves solving a system of equations.  Demonstrate that your function from problem 1 can be used to solve this system

%calculate force of a muscle holding dumbbell

Wd = -500 ;%N , weight of dumbbell
Wa = -17 ; %Weight of arm
Fm = 3478; %force of muscle required to resist rotation.

%show torques measured 
Td = -170; %Nm, torque to resist dumbbell
Ta = -3.9; %Nm, torque to resist retoation in arm
Tm = 173.9; %Nm, torque required to not rotate from muscle
%we find the distance for each weight acting along the arm from the elbow
% x is the moment arm

forces = [Wd Wa Fm]
A = diag(forces);
b = [Td; Ta; Tm];
[x] = Montayre_Gauss(A,b)


%3.	What is the relationship between the rank of a matrix and the solution of the corresponding system of equations?
%Rank tells you how many independent variables there are. The number of independent variables tell you how many solutions you have, from which any multiple of them can satisfy as a solution.



%4.	Given the following SVD of a matrix A:

%A =[0.40 -0.78 0.47; 0.37 -0.33 -0.87; -0.84 -0.52 -0.16][7.10 0 0; 0 3.10 0; 0 0 0][0.30 -0.51 -0.81; 0.76 0.64 -0.12; 0.58 -0.58 0.58]     

%What is the rank of A?
%2 bc eigen values from second matrix


%Use this decomposition of A, with no calculations, to write a basis for Col A, Nul A, Row A, and Nul AT.  Write out an interpretation for each of these subspaces.  What can they tell you about a given system?

%Calculate A and illustrate how the bases for Nul A and Nul AT provide valid solutions to the respective problems.


A =[0.40 -0.78 0.47; 0.37 -0.33 -0.87; -0.84 -0.52 -0.16]*[7.10 0 0; 0 3.10 0; 0 0 0]*[0.30 -0.51 -0.81; 0.76 0.64 -0.12; 0.58 -0.58 0.58]


%

%Find SVD of the following matrix using Matlab. Illustrate how the basis
%vectors for the four fundamental spaces describe the associated properties
%of the matrix

B = [4 -2; 2 -1; 0 0];
[U,S,V] = svd(B)



%7. Problem 2.12 from textbook

mass = [700 70 55 15 0.4];
meta = [11760 1700 1450 720 30];

plot(mass,meta)
hold on

%log(meta) = a*log(mass) + log(k)
p = polyfit(log(mass), log(meta),1);
a = p(1);
k = exp(p(2));
plot(k*mass.^a)


%8
%Downloaded Ultrasound toolbox from internet
%Ultrasound datasets are over 1 GB each so this was a must
%Opened example dataset from toolbox and used basic fitting tool


%9 Image from lab; decimate 3 different ways; discuss application
Owl = imread('ECA_ICAjunction.jpg');
Owl1 = im2double(Owl);
figure(1); hold on;
subplot(1,3,1);
imagesc(Owl1); colormap(gray);
for i=1:72, 
    for j=1:128
        Owl_sparse(i,j) = Owl1(i*10,j*10);

    end, 
end
title('Owl');
subplot(1,3,2);
imagesc(Owl_sparse); colormap(gray);
title('Owl Sparse');

[Xi,Yi] = ndgrid(1:.05:72,1:.05:128);
[X,Y] = ndgrid(1:72,1:128);
Owl_sparse_i = interpn(X, Y, Owl_sparse, Xi, Yi, 'spline');
colormap gray
axis off
title('Owl Sparse');
subplot(1,3,3); 
imagesc(Owl_sparse_i)
axis off
title('Owl sparse interpolated');


for i=1:144, 
    for j=1:256
        Owl_sparse(i,j) = Owl1(i*5,j*5);

    end, 
end
title('Owl');
subplot(1,3,2);
imagesc(Owl_sparse); colormap(gray);
title('Owl Sparse');


for i=1:240,   for j=1:426
        Owl_sparse(i,j) = Owl1(i*3,j*3);

    end, end
title('Owl');
subplot(1,3,2);
imagesc(Owl_sparse); colormap(gray);
title('Owl Sparse');


%10

func = y+ x^2 -0.5;
xlow = 0;
xhigh = 10;
tol_bisection = 40;
tol_NR = 15;

[bisect_zero,NR_zero] = awesome_function(func,xlow,xhigh,tol_bisection,tol_NR)

%11

%roots gives the roots of a polynomial function as coefficients in a column vector
%for example: 3x^2 - 2x -4 = 0;
p = [3 2 4];
p1 = roots(p);

%fsolve is a nonlinear system solver that solves with some initial guess as
%a start
%for example
% to find a matrix that satisfies X*X*X = [1 2;3 4]
solve = @(x)x*x*x - [12;34]
options = optimooptions('fsolve','Display','off');
x0 = ones(2);
[x,fval,exitflag,output] = fsolve(solve,x0,options);
x


%fzero finds the point where the function = 0, which is also where the
%function changes sign
%for example
fun = @sin;
y0 = 4;
[y,fval] = fzero(fun(y0));
y

%12
%For ultrasound, SVD's are used to for clutter filters for blood flow. This
%is mainly used for microvessel imaging.These mainly use an rSVD
%(randomized
%SVD)and random downsampling to make this smaller.
%Actual ultrasound datasets are huge and not practical for my computer
%hardware i think
%For the sake of this example, im just going to make a random set of
%numbers for the input matrix, randomly draw samples from the input matrix,
% then make an SVD from that

input = randn(100,3);
rando = input(randperm(size(input, 1), 10), :);

[U1,S1,V1] = svd(rando)