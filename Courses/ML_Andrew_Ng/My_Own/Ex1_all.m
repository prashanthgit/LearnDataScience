
% clear
clear all
close all
clc

%load the data
data = load('ex1data1.txt');

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