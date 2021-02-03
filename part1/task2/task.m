% Task 2 script
clear

% Generates 10,000 random points normally distributed.
x = randn(10000,3);

% Mean and covariance matrix of vector x
meanVec = mean(x).';
covMat = cov(x);

% Creating a multivariate Gaussian probability distribution
x = x.';
gausspdf = gaussian_pdf(x, meanVec, covMat);

% Finding the 10th, 50th and 90th percentiles
prc10 = prctile(gausspdf,10);
prc50 = prctile(gausspdf,50);
prc90 = prctile(gausspdf,90);

% Plotting the elipsoids:
% A tolerance required to eleviate floating-point roundoff error using find
tol = 0.0005;

% Finds the indices of each value of gausspdf in each percentile
idx10 = find(abs(gausspdf-prc10) <= tol);
idx50 = find(abs(gausspdf-prc50) <= tol);
idx90 = find(abs(gausspdf-prc90) <= tol);

% Calculates the dimension positions using the indices in each percentile
xpos = (x(:,idx10)).';
ypos = (x(:,idx50)).';
zpos = (x(:,idx90)).';

% Creates a Delaunay triangulation from the positions in 3 dimensions 
del10 = delaunay(xpos);
del50 = delaunay(ypos);
del90 = delaunay(zpos);

% Plots and saves each 
figure
trisurf(del10, x(1,idx10), x(2,idx10), x(3,idx10))

figure
trisurf(del50, x(1,idx50), x(2,idx50), x(3,idx50))

figure
trisurf(del90, x(1,idx90), x(2,idx90), x(3,idx90))


