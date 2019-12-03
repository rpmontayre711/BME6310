% interpolation examples


%% INTERP1 - Generate a coarse sine curve and interpolate over a finer abscissa.
x = 0:10; 
y = sin(x); 
xi = 0 : 0.25 : 10; 
yi = interp1(x,y,xi);   % use of "interp1"
plot(x,y,'o',xi,yi)



%% SPLINE - This generates a sine curve, then samples the spline over a finer mesh
x = 0:10;
y = sin(x);
xx = 0:.25:10;
yy = spline(x,y,xx);   % use of "spline"
plot(x,y,'o',xx,yy)



%% INTERP2 - Interpolate the peaks function over a finer grid.
[X,Y] = meshgrid(-3:.75:3);
Z = peaks(X,Y);
[XI,YI] = meshgrid(-3:.05:3);
ZI = interp2(X,Y,Z,XI,YI);   % use of "interp2"
mesh(X,Y,Z), hold, mesh(XI,YI,ZI+15)  % plot the interpolated function shifted 15 up
axis([-3 3 -3 3 -5 30])


%% INTERP2 - Example 2
% Given this set of employee data,
years = 1950:10:1990;
service = 10:10:30;
wage = [150.697 199.592 187.625
179.323 195.072 250.287
203.212 179.092 322.767
226.505 153.706 426.730
249.633 120.281 598.243];

wage_new = [wage(:,1)' wage(:,2)' wage(:,3)']
years_new = [years years years]
service_new = [10 10 10 10 10 20 20 20 20 20 30 30 30 30 30]
plot3(years_new, service_new, wage_new,'k*'); hold on;
plot3(1975,15,0,'r*')
xlabel('years');ylabel('service');zlabel('wage');
grid on;

%% it is possible to interpolate to find the wage earned in 1975
% by an employee with 15 years' service:

w = interp2(service,years,wage,15,1975)
plot3(1975,15,w,'b*')