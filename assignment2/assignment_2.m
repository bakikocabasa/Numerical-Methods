%b) plotting temperature vs height

T = linspace(1,80,80);
[h,hi] = thermometer(T);
X = [T;hi];
%% 
figure
plot(T,hi,'.')
xlabel('Temperature')
ylabel('Afflicted Height')
title('Afflicted Height vs Temperature')

%task d
[alfa, beta,N] = regression(X);
h_values = alfa + beta.*T;
hold on
plot(T, h_values,'r');
legend('data points', 'regression line')
 %%
%comparison of afflicted and ideal height values
figure
plot(T,hi, 'g')
xlabel('Temperature')
ylabel('Height')
title('comparison of ideal and afflicted height values')
hold on
plot(T,h,'k')
legend('Afflicted height','ideal height')

%e) calculation of mean squared error
h_diff_sq = (h - hi).^2;
summation=sum(h_diff_sq);

clc

mean_square_error = summation/N

% another metric we are using here is Standard deviation. which in this
% case is square root of mse. It is considered as the most appropriate
% measure of variability within a sample of data. It help us assess how far
% the values are spread above and below the mean.

standard_deviation = mean_square_error^(1/2)