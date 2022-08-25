clear all
close all
clc

A = [4 -6; -31 189];
y0 = [1;2];
h = [0.01, 0.02];
t_end = 2;
t_ana = 0:0.01:2;

y_ana =  @(t_ana)(1/17)*[18 -1;3 31]*[exp(-3*t_ana);exp(-190*t_ana)];
y = y_ana(t_ana);

for j = 1:2
 figure(j)
[z1,y_exp] = explicitEulerVector(A, y0, t_end, h(j));
[z2,y_imp] = implicitEulerVector(A, y0,t_end, h(j));
subplot(2,1,1)
plot(t_ana,y(1,:),'b-','linewidth',1.5)
hold on ;
plot(z2, y_imp(1,:),'y-','linewidth',1.5);
hold on;
plot (z1, y_exp(1,:),'r-');
hold on;
title(sprintf('Analytical vs Explicit Euler vs Implicit Euler for y1 @ h=%d', h(j)))
axis([0 5 0 2]);
grid minor;
legend('y1 Analytical','y1 Explicit', 'y1 Implicit');

subplot(2,1,2)
plot(t_ana,y(2,:),'b-','linewidth',1.5);
hold on; 
plot(z2, y_imp(2,:),'y-','linewidth',1.5);
hold on;
plot(z1, y_exp(2,:),'r-');
hold on;
title(sprintf('Analytical vs Explicit Euler vs Implicit Euler for y2 @ h=%d', h(j)));
axis([0 2 0 1.2]);
grid minor;
legend('y2 Analytical','y2 Explicit', 'y2 Implicit')
end

disp('-------------Comments---------------');
disp('1. Implicit Euler Method is more stable then Explicit Euler Method because');
disp('it converges irrespective of stepsize unlike Explicit Method');
disp('2. As step size double from h -> 2h Explicit Euler Method interduces the quadratic error term as compare to Neumann series');

