function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;
temp =10000;
finalC=0; finalsigma=0;

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
for i= 1:10
    for j= 1:10
		model = svmTrain(X, y,C, @(x1, x2) gaussianKernel(x1, x2,sigma));
        predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		if (temp>error)
		temp=error;
		finalC=C;
		finalsigma=sigma;
		end
		if(mod(j,2)=1)
		sigma*=3;
		elseif (mod(j,2)=2)
		sigma/=3;
		sigma*=10;
		end
    end
	sigma=0.01;
		if(mod(i,2)=1)
		C*=3;
		elseif (mod(i,2)=2)
		C/=3;
		C*=10;
		end
end

C=finalC;
sigma=finalsigma;






% =========================================================================

end
