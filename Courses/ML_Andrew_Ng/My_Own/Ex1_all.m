
% clear
clear all
close all
clc

%load the data
data = load('../machine-learning-ex1/ex1/ex1data1.txt');

%training data length m
m = length(data(:,1));

% parameter length n
n = 2;

% X the design matrix R (m by 2)
X = [ones(m,1) data(:,1)];

% theta = [0;0;] are the parameters to optimise, initial guess is 0,0
theta = zeros(n,1);

% y is training input
y= data(:,2);


% first plot the data
figure(1);
plot(data(:,1),data(:,2),'rx','MarkerSize',10);
xlabel('Population (in 10k)');
ylabel('Profit (in 10k $)');
title('Population vs. Profit');

fprintf('Program paused. Press enter to continue.\n');
pause;

% cost function
% Test the cost function

J = costFunctionJ(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 32.07\n');


% Training the sample
% Start alpha with 0.01
alpha = 0.01;
%Iterations 
iterations = 1500;

% Use a function Gradiant desent algo
[theta, J_history] = gradiantDesent(X,y,theta, alpha, iterations);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  plot J history
figure(2);
plot(J_history);
xlabel('# iterations');
ylabel('J');
title('Cost function');


% Plot J for thetas
theta1 = [-10:1:10];
theta2 = [-5:0.5:5];
J_theta = zeros(length(theta1),length(theta2));

for i = 1:length(theta1)
    for j = 1:length(theta2)
        J_theta(i,j) = costFunctionJ(X,y,[theta1(i);theta2(j)]);
    end;
end;

J_theta = J_theta';
% Surface plot
figure(3);
surf(theta1, theta2, J_theta)
xlabel('\theta_0'); ylabel('\theta_1'); zlabel('J');

%contour plot
figure(4);
contour(theta1,theta2,J_theta, logspace(-2, 3, 20));
hold on;
plot(theta(1),theta(2),'rx','MarkerSize',10);


