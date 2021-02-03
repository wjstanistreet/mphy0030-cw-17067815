function [optiVal] = gradient_descent(a, iniVal, stpSize, maxIter, stpTol, grdFun)
%
% gradient_descent iteratively finds the minimum value of a multivariate
% function, mvf, using an intial value of the function, iniVal, with a step
% size, stpSize,  a maximum number of iterations, maxIter, and a tolerance
% of the function between steps, stpTol,
% 
% --- Inputs ---
% 
% a         - Multivariate input function 
% iniVal    - Initial value of the input function
% stpSize   - Step size of the gradient descent
% maxIter   - Maximum number of iterations
% stpTol    - Tolerance of function between subsequent steps 
% grdFun    - Gradiet function of the input multivariate function
% 
% --- Output ---
% 
% optiVal   - Optimum location that minimises the multivariate function

% Selecting the initial value as the current value for loop
currVal = iniVal;

% Beginning iteration at 0
i = 0;

% Initialisng optiVal
optiVal = zeros(((maxIter)+1),3);

while i <= maxIter
    % Gradient descent function Θ1=Θ0-α∇J(Θ)
    nextVal = currVal - stpSize*grdFun;
    
    % Calculates the difference
    delta = abs(nextVal - currVal);
    
    % Checks if the tolerance is "exceeded"
    if delta <= stpTol
        break
    end
    
    % Progress to next iteration and value 
    i = i+1;
    currVal = nextVal;

    % Outputs optimum location 
    optiVal(i,:) = currVal;
end
   


end 