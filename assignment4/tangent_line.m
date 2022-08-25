function []=tangent_line(xTangent,x3,f,difference_quotient_central_graph)
[m,n]=find(x3==xTangent);
xTangent2 = xTangent;
% Equation of the tangent is y = slope*x + offset
% From the difference_quotient_central_graph we know the related slope value is in index mxn..
% Find the slope at x = xTangent.
slope = difference_quotient_central_graph(m,n);
% We want to plot the tangent line where it just touches the curve,
% so we need to know the y value at xTangent.
yTangent = f(xTangent2);  % Y value of curve at x = xTangent.
hold on;
plot(xTangent2, yTangent, 'r*', 'LineWidth', 2, 'MarkerSize', 10);
% Use point slope formula of a line to get equation for y
% y-y0 = slope*(x-x0).
% y = slope * (x - xTangent) + yOffset
yTangentLine = slope * (x3 - xTangent2) + yTangent;
plot(x3, yTangentLine, 'r-', 'LineWidth', 1);