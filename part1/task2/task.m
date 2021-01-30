% Task 2 script

% Generates 10,000 random points normally distributed.
x = randn(10000,3);

% Mean and covariance matrix of vector x
meanVec = mean(x);
covMat = cov(x);

% Creating a multivariate Gaussian probability distribution
gausspdf = gaussian_pdf(x, meanVec, covMat);

% Finding the 10th, 50th and 90th percentiles
prc10 = prctile(gausspdf,10);
prc50 = prctile(gausspdf,50);
prc90 = prctile(gausspdf,90);

% Plotting the elipsoids:




