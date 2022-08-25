%% 3.1 Script to calculate and compare the same integral using different methods
format long

%% Compute calling the trapezoide rule function we created

f = @(x) exp(x);
a = 0;
b = 1;
q = trapez(f,a,b)

%% Compute with the Matlab commands

q1 = integral(f,a,b)
range = a:b;
Y=exp(range);
q2 = trapz(range,Y)

% Comparisson of the three results: q and q2 are equal just because the
% function that I wrote in trapez.m does the same work with the build in
% trapz function. However, q1 which is the integral result gives another
% result. That is because trapez function is kinda approximed integral that
% we have used. The real integral value for the given interval is 1.7183.

% Compute with subintervals 


J1 = [10:10:1000000];
q3 = subintervals(f,a,b,J1)

%when we divide our trapezoidal integral into subintervals, we get better
%approximation of the real integral. More we divide into smaller peaces,
%more accuracy we get at the end. That is just because of having more
%preciese subintegrals from the given subintervals and sum them up at the end.
%Our overall result has  -1.431899137394055e-05 offset between the
%real integral result and 100 subinterval result. 

