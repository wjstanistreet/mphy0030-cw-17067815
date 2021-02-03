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

% Forms the gradient function, grdFun, with the parameters stated
grdFun = finite_difference_gradient(a, x);

% Calculates the optimum lowest value of x
optiVal = gradient_descent(a, iniVal, stpSize, maxIter, stpTol, grdFun);
R_optiVal = round(optiVal, 3, 'significant');
fprintf('The optimum value is at: (%f, %f, %f)', R_optiVal);

% We can verify if this position is at the lowest point of the function by
% differentiating the function twice. If the first partial differential is
% 0, we know the position is stationary. If the second partial differential
% is positive, the function is a minimum.
% optiFun = quadratic_polynomial(a, optiVal);
% optiGrad1 = finite_difference_gradient(a, optiVal);
% optiGrad2 = finite_difference_gradient(a, optiGrad1);



