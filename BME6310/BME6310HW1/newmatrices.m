function [A, Anew] = newmatrices(n)
A = ones(n);
B = zeros(n);
Anew = [A B; B A];
end
