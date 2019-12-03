function [x] = Montayre_Gauss(A,b)
x = zeros(3,1);
m21 = ((-1)*A(2,1))./ A(1,1);
m31 = ((-1)*A(3,1))./ A(1,1);

xelim1 = m21.*A(1,:) + A(2,:);  %eliminates x term and left w/ y and z
xelim2 = m31.*A(1,:) + A(3,:);

b2 = b(2) + m21*b(1);

b3 = b(3) + m31*b(1);


m22 = (-1)* (xelim1(2)/(xelim2(2)));

yelim = xelim1 + m22.*xelim2;


b3 = m22*b3;

x(3) = (b2+b3)/(yelim(3));  %gives z

%back substitution

x(2) = (b2 - x(3)*xelim1(3))/xelim1(2);  %gives y

x(1) = b(3) - (4*x(2) +2*x(3));

end 
