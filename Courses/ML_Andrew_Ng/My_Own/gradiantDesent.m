%Gradiant Decent algo
%training data length m

function [theta, J_history] = gradiantDesent(X,y,theta, alpha, iterations)
m = length(X(:,1));
J_history = zeros(iterations,1);

    for i=1:iterations
        error = (X * theta - y);
        delta = X' * error;
        theta = theta - (1/m) * alpha * delta;
        J_history(i) = costFunctionJ(X,y,theta);
    end;
end

