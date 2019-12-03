%% least-squares fit examples

x = linspace(3,30,10);
y = [5 13 16 14 18 23 20 32 29 28];
figure(1); hold on;
plot(x,y,'ks')

n = length(x);
ave_x = mean(x);
ave_y = mean(y);
a1 = ( n*sum(x.*y) - sum(x)*sum(y) ) / ( n*sum(x.^2) - (sum(x))^2 )
a0 = ave_y - a1*ave_x

fplot(@(x)4.8515+.3525*x,[0,20])



%% built-in matlab function 'polyfit'
fit = polyfit(x,y,1)


%% nonlinear regression
x = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
y = [.9 6.2 10.1  17.4  23  38  51.2  66.7 82 101  135  140 185 199 260];
figure;
subplot(1,2,1);
plot(x,y,'ks');
subplot(1,2,2);
plot(log(x),log(y),'ro'); hold on;
fit = polyfit(log(x),log(y),1)
fplot('0.0986+1.9807*x',[0,3])

% what's the slope?  what's the intercept?


%% read in and plot data
data_x1 = [0 1 1 2 2 3 3 4 4];
data_x2 = [0 1 2 1 2 1 2 1 2];
data_y = [15.1 17.9 12.7 25.6 20.5 35.1 29.7 45.4 40.2];
figure;
scatter3(data_x1,data_x2,data_y,'filled')
hold on
% calculate multiple linear regression (the long, hard way)
number = size(data_x1,2);
sum_x1 = sum(data_x1); 
sum_x2 = sum(data_x2);
sumX1squared = sum(data_x1.^2);
sumX1X2 = sum(data_x1.*data_x2);
sumX2squared = sum(data_x2.^2);
sum_y = sum(data_y);
sumX1Y = sum(data_x1.*data_y);
sumX2Y = sum(data_x2.*data_y);
A = [number    sum_x1    sum_x2
    sum_x1   sumX1squared   sumX1X2
    sum_x2   sumX1X2   sumX2squared];
b = [sum_y
    sumX1Y
    sumX2Y];
coef_vector = inv(A)*b

% plot the regressed function
x1fit = min(data_x1):0.1:max(data_x1);
x2fit = min(data_x2):0.1:max(data_x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = coef_vector(1) + coef_vector(2)*X1FIT + coef_vector(3)*X2FIT;
mesh(X1FIT,X2FIT,YFIT)

%% calculate multiple linear regression the easy way (15 lines to 1 line)

% the vector of ones accounts for constant
X = [ones(size(data_x1))' data_x1' data_x2'];
b = regress(data_y',X); % also removes NaN data

figure;
scatter3(data_x1,data_x2,data_y,'filled'); hold on;
x1fit = min(data_x1):0.1:max(data_x1);
x2fit = min(data_x2):0.1:max(data_x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT;
mesh(X1FIT,X2FIT,YFIT)


%% example of multi-linear regression
load carsmall
x1 = Weight;
x2 = Horsepower; % Contains NaN data
y = MPG;
figure;
scatter3(x1,x2,y,'filled')
xlabel('Weight')
ylabel('Horsepower')
zlabel('MPG')
hold on

X = [ones(size(x1)) x1 x2 x1.*x2];
b = regress(y,X); % also removes NaN data

x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
view(50,10)