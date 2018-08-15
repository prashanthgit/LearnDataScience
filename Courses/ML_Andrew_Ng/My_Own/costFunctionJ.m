
% Cost function J
function J = costFunctionJ(X, y, theta)
% X - Design matrix
% y - is the class labels/ actual
%theta - features
prediction = X * theta;
sumSquareError  = sum( (prediction - y).^2);

%training data length m
m = length(X(:,1));

% retrun
J = 1/(2*m)*sumSquareError;

