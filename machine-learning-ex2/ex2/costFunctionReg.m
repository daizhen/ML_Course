function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


cost_of_0 = -y.*log(1./(1+(exp(-X*theta))));
cost_of_1 = (y.-1).*log(1-1./(1+(exp(-X*theta))));

theta_length = length(theta);

J = (1/m)*sum(cost_of_0 + cost_of_1) + (lambda/(2*m))*sum(theta(2:theta_length).^2);


grad = (1/m).*(X' * (1./(1+(exp(-X*theta))) - y)) + lambda/m*theta;
grad(1) = (1/m)*sum(X(1:m)' .* (1./(1+(exp(-X*theta))) - y));


% =============================================================

end