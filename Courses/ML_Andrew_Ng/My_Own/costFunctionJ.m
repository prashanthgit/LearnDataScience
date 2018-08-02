
% Cost function J
function J = costFunctionJ(X, y, theta)
% X - Design matrix
% y - is the class labels/ actual
%theta - features

m = size(X,1); % Number of training samples
predictions = X * theta;
sqrErrors = (predictions - y).^2;

J = 1/(2*m) * sum(sqrErrors);