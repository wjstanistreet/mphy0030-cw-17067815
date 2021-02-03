function gausspdf = gaussian_pdf(x, meanVec, covMat)
% Generates a 3D Gaussian probability density function 
% 
% gaussian_pdf generates a 3D Gaussian probability density function from a
% 3 dimensional vector, x, a mean vector, meanVec, and a covariance matrix,
% covMat.
% 
% --- Inputs ---
% x         - Multivariate vector; x = [x1,x2,x3]
% meanVec   - Mean vector of x
% covMat    - Covariance matrix of x
% 
% --- Output ---
% gausspdf     - 3D Gaussian probability density function

% Preallocating for speed
gausspdf = zeros(length(x),1);

% Iterate for each value of 
for i = 1:length(x)
gausspdf(i) = (1/((2*pi)^(3/2))*(sqrt(det(covMat))))*exp((-1/2)*((x(:,i)-meanVec).'*(inv(covMat))*((x(:,i)-meanVec))));
end

end