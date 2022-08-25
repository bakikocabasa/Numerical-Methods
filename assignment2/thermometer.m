
function [h,hi] = thermometer(T)
%Assignment 2 Task 2.1
%a) creating a function thermometer
T=double(T);
error = (.75+.75)*rand(size(T)) -.75;
h = 2 + (0.2 * T);
hi = 2 + (0.2* T) + error;
end