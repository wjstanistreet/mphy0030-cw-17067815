function fdg = finite_difference_gradient(a, x)
%  
% finite_difference_gradient calculates the finite difference between
% points in a multivariate function, mvf. 
% 
% --- Inputs ---
% 
% mvf       - Input multivariate function 
% ivv       - Variable vector representing the position
% 
% --- Output ---
% 
% fdg       - Finite difference gradient

% For this coursework, the input multivariate function is equal to
%  𝑓(𝐱)=𝑎1𝑥1^2+𝑎2𝑥2^2+𝑎3𝑥3^2+𝑎4𝑥1𝑥2+𝑎5𝑥1𝑥3+𝑎6𝑥2𝑥3+𝑎7𝑥1+𝑎8𝑥2+𝑎9𝑥3+𝑎0
h = 1E-3;

% The finite difference between the next forward position of each
% dimension from their central position ...
Forx = [x(1)+h, x(2), x(3)];
Fory = [x(1), x(2)+h, x(3)];
Forz = [x(1), x(2), x(3)+h];

% ... and backwards from their central positions.
Bacx = [x(1)-h, x(2), x(3)];
Bacy = [x(1), x(2)-h, x(3)];
Bacz = [x(1), x(2), x(3)-h];

% We can approximate the partial difference in each dimension.
dfdx = (quadratic_polynomial(a,Forx));
dfdy = (quadratic_polynomial(a,Fory));
dfdz = (quadratic_polynomial(a,Forz));

dbdx = (quadratic_polynomial(a,Bacx));
dbdy = (quadratic_polynomial(a,Bacy));
dbdz = (quadratic_polynomial(a,Bacz));


dx = (dfdx-dbdx)/(2*h);
dy = (dfdy-dbdy)/(2*h);
dz = (dfdz-dbdz)/(2*h);

fdg = [dx, dy, dz];

end 
