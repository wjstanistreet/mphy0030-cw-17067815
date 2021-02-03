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

% Finding the 10th, 50th and 90th percentile values: we can use these
% values to find the corresponding indices of the Gaussian distribution.
prc10 = prctile(gausspdf,10);
prc50 = prctile(gausspdf,50);
prc90 = prctile(gausspdf,90);

% Plotting the elipsoids:
% A tolerance required to eleviate floating-point roundoff error using find
tol = 0.0007;

% Finds the indices of each value of gausspdf in each percentile:
idx10 = find(abs(gausspdf-prc10) <= tol);
idx50 = find(abs(gausspdf-prc50) <= tol);
idx90 = find(abs(gausspdf-prc90) <= tol);

% Using the indices of the percentiles, we can find the corresponding
% x vector positions in each dimension.
% Calculates the dimension positions using the indices in each percentile
x10pos = (x(:,idx10)).';
x50pos = (x(:,idx50)).';
x90pos = (x(:,idx90)).';

% With the percentile values of each dimension, we can use Delaunay
% triangulation to form a set points for each dimension. 
del10 = delaunay(x10pos);
del50 = delaunay(x50pos);
del90 = delaunay(x90pos);

% Plots and saves each ellipsoid
figure(1)
trisurf(del10, x(1,idx10), x(2,idx10), x(3,idx10))
title('10th Percentile ellipsoid')
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
saveas(figure(1),'10th Percentile ellipsoid')

figure(2)
trisurf(del50, x(1,idx50), x(2,idx50), x(3,idx50))
title('50th Percentile ellipsoid')
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
saveas(figure(1),'50th Percentile ellipsoid')

figure(3)
trisurf(del90, x(1,idx90), x(2,idx90), x(3,idx90))
title('90th Percentile ellipsoid')
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
saveas(figure(1),'90th Percentile ellipsoid')



