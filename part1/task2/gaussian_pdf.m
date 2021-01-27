function gauspdf = gaussian_pdf()
% Generates a 3D Gaussian probability density function 
% 
% gaussian_pdf generates a 3D Gaussian probability density function from a
% 3 dimensional vector, x, a mean vector, meanVec, and a covariance matrix,
% covMat.
% 
% --- Inputs ---
% x         - 3 dimensional vector x = [x1,x2,x3]
% meanVec   - Mean vector of x
% covMat    - Covariance matrix of x
% 
% --- Output ---
% gauspdf     - 3D Gaussian probability density function

gauspdf = (1/(((2*pi)^(3/2))*(sqr(det(covMat)))))*exp(-(1/2)*(x-meanVec)...
        *inv(covMat)*(x-meanVec));

end