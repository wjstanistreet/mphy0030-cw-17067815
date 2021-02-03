% Task 3 script
clear

% Random parameter values for a
a = randi(10,[10,1]);

% Reasonable values for x
x = [1, 2, 3]; 

% Minimising the function
% Initial values:
iniVal = x;
stpSize = 0.0001;
maxIter = 1000;
stpTol = 0.0001;

grdFun = finite_difference_gradient(a, x);

optiVal = gradient_descent(a, iniVal, stpSize, maxIter, stpTol, grdFun);



