%%%%Task 1
clc
clear all
close all
x0=[0; 0];
syms x1;
syms x2;
%% sector a
%function is described as given in the assignment
%% sector b
f1= 6*x1-cos(x1)-2*x2;
f2= 8*x2-x1*x2^2-sin(x1);
F=[f1;f2];
figure
fsurf(f1)
xlabel('x1');
ylabel('x2');
zlabel('f');
title('6*x1-cos(x1)-2*x2')
figure
fsurf(f2)
xlabel('x1');
ylabel('x2');
zlabel('f');
title('8*x2-x1*x2^2-sin(x1)')
JF=jacobian([f1,f2],[x1,x2]); %finds the jacobian for the given variables.
Newton_solution_f1=newton2d(F,JF,x0,"full") %to find the zeros by using newtons method
[Numerical_solution_f1]=newton2d(F,JF,x0) %to find the zeros by using numerical methods
find_my_zeros2_cell=struct2cell(Numerical_solution_f1); 
find_my_zeros2_string=string(find_my_zeros2_cell);
Numerical_solution_f1=str2double(find_my_zeros2_string);
%since the syms defined functions can not be 
% solved by the fsolve, we have to use which is called vpasolver. 
%however it gives a result in sym as well. So in this steps, I convert them

error=abs(Newton_solution_f1-Numerical_solution_f1)
%so the error between the newton method solution and numerical solution are
%same

%% sector c
f3= exp(-exp(-(x1 + x2))) - x2*(1 + x1.^2);
f4= x1* cos(x2) + x2* sin(x1)-0.5;
figure
fsurf(f3)
xlabel('x1');
ylabel('x2');
zlabel('f');
title('exp(-exp(-(x1 + x2))) - x2*(1 + x1.^2)')
figure
fsurf(f4)
xlabel('x1');
ylabel('x2');
zlabel('f');
title('x1* cos(x2) + x2* sin(x1)-0.5')
F2=[f3;f4];
JF2=jacobian([f3,f4],[x1,x2]);
[Newton_solution_f2,n_stored]=newton2d(F2,JF2,x0,"full")
[Numerical_solution_f2]=newton2d(F2,JF2,x0) 
%graph is missing
%% sector d
[Diverging_solution_f2,n_stored_diverging]=newton2d(F2,JF2,x0,"diverging")
find_my_zeros2_cell=struct2cell(Numerical_solution_f2); 
find_my_zeros2_string=string(find_my_zeros2_cell);
Numerical_solution_f2=str2double(find_my_zeros2_string);
error_diverging=abs(Diverging_solution_f2-Numerical_solution_f2)
%there are some certain requirements for newton method to converge itself
%to the root of the function which makes the function itself 0. If the
%conditions does not matched. It may diverge towords infinity or can move
%up and down without settling itself to towards a root.
%from the results, we can see that x2 and x1 does not converges to the root
%of the function hence, we can find some x0 initial points, which leads us to
%have non converging results.