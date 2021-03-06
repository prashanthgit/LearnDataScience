function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

sig2 = [0.01; 0.03; 0.1; 0.3; 1.0; 3.0; 10.0; 30.0];
C_test    = [0.01; 0.03; 0.1; 0.3; 1.0; 3.0; 10.0; 30.0];
opt_sig2 = 0;
opt_C = 0;
error = inf;

for i = 1:size(sig2,1)
    for j = 1:size(C_test,1)
        model= svmTrain(X, y, C_test(j), @(x1, x2) gaussianKernel(x1, x2, sig2(i)));
        ypredict = svmPredict(model, Xval);
        err = mean(double(ypredict ~= yval));
        if err < error
            error = err;
            opt_sig2 = sig2(i);
            opt_C = C_test(j);
        end
        %fprintf('hello  %i  %i  %i',i,j,error);
    end
end

        
C = opt_C;
sigma = opt_sig2;



% =========================================================================

end
