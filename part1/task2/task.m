% task 2 script

x = zeros(10000,3);
x(:,1) = randn(10000,1);
x(:,2) = mean(x(:,1))+std(x(:,1))*randn(10000,1);
x(:,3) = mean(x(:,1))+std(x(:,1))*randn(10000,1);

