%c) determining alfa and beta using function Regression
% here we have used the least square method to do the linear Regression
%equation of line = alfa + beta * x

function [alfa, beta,N] = regression(X)
        T = X(1,:); %assign T as T for this function. X includes temperature and height values together but in different rows
        hi=X(2,:);
        N = length(T); %take the length of the temperature values
        X1 = [ones(size(T));T];
       phi = pinv(X1);      %calculates the pseudo inverse of matrix X1 i.e. (X1'*inv(X1*X1'))
       theta = hi*phi;       %theta 1 = alfa, theta 2 = beta
       alfa = theta(1,1);
       beta = theta(1,2);
end