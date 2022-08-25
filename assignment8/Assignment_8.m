clc
clear all
close all
t_end = 2;
f = @(t,y) 2*t*(1+y);
% f = 2t(1+y);
y_analytical=@(t) exp(t^2)-1; 
%analytical solution is made by seperation of variables. which is e^(t^2)-1
y_0 = 0;

h=[1; 0.5; 0.1; 0.01];

for i=1:length(h)
%by calculating this part, we approximate the integral of the given
%function f.
[y_explicit,t_exp_eul] = explicit_euler(f,y_0,t_end,h(i));
[y_improved_euler,t_eul_heun] = improved_euler(f,y_0,t_end,h(i));
[y_euler_heun,t_imp_eul] = euler_heun (f,y_0,t_end,h(i));

figure(i)

fplot(y_analytical,[0,2]) %plotting the analytical solution respect to given interval
hold on
plot(t_imp_eul,y_improved_euler,t_eul_heun,y_euler_heun,t_exp_eul,y_explicit)
legend('y analytical','y improved euler','y euler heun','y explicit euler')
title(strcat('h=',num2str(h(i))))
xlabel('time');
ylabel('y values');
xlim([0 2])
% ylim([0 60])
hold off

end