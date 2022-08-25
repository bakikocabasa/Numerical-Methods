clc
clear all
close all
format long
f=@(x) x^3+x-1;
x0_1=0.7;
x0_2=0.7;
a=fsolve(f,x0_1);
fprintf('root of the function via fsolve is: %f \n',a)
x_star=(1/6)^(2/3)*(((2*(9+sqrt(93)))^(1/3)-(2*(-9+sqrt(93)))^(1/3)));
error=abs(x_star-a);
fprintf('error between numerical calculation and analytical calculation is : %d \n',error)


g1_x = @(x) 1./(x.^2+1);
g2_x = @(x) 1-x.^3;

for i=1:20
    x1_1(i,1)=g1_x(x0_1(i,1));
    x1_2(i,1)=g2_x(x0_2(i,1));
    x0_1(i+1,1)=x1_1(i,1);
    x0_2(i+1,1)=x1_2(i,1);
end
x0_1(end)=[];
x0_2(end)=[];
error_1=abs(x_star-x1_1)
error_2=abs(x_star-x1_2)
% [m,n]=find(min(error_1))
fprintf('error between numerical calculation and analytical calculation is : %d \n',error)
% in every iteration x_k+1 value get equal to the g(x_k) value in this
% matter. We update the value by defining it with the previous value in
% this code. At the end iteratively we come closer to the fixed point.


cobweb(g2_x,x0_1)
%this tripy tunnel explains...
