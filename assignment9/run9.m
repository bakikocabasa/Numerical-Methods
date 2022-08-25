%Assignment 9
clc
clear all
close all
%y'=-Ay
%(-A)=[-4 6; 31 -189];
%stiffness matrix
A=-[-4 6; 31 -189];
y0=[1;2];

t_end=2;
h=0.02;
t=0:h:t_end;

% calculate the analytical solution
[V,W]=eig(-eye(2)-A);
y=@(t) V*[exp(W(1,1)*t) 0; 0 exp(W(2,2)*t)]*inv(V)*[1;2];

y_analytical = zeros(2,length(t));
i=0;
for ti=0:h:t_end
    i=i+1;
    y_analytical(:,i) = y(ti);
end

%calculate the numerical solution with stepsize=0.02
y_explicit = explicitEulerVector(A,y0,t_end,h);
y_implicit = implicitEulerVector(A,y0,t_end,h);


%some plotting
f1=figure;
hold on 
plot(t, y_explicit(1,:), DisplayName="explicit")
plot(t, y_implicit(1,:), DisplayName="implicit")
plot(t, y_analytical(1,:), DisplayName="analytical")
legend()
title("y1- stepzize=0.02")
f2=figure;
hold on
plot(t, y_explicit(2,:), DisplayName="explicit")
plot(t, y_implicit(2,:), DisplayName="implicit")
plot(t, y_analytical(2,:), DisplayName="solution")
legend()
title("y2- stepzize=0.02")
%-----------------------------------------

h=0.01;
t=0:h:t_end;

y_analytical = zeros(2,length(t));
i=0;
for ti=0:h:t_end
    i=i+1;
    y_analytical(:,i) = y(ti);
end
%calculate the numerical solution with stepsize=0.01
y_explicit = explicitEulerVector(A,y0,t_end,h);
y_implicit = implicitEulerVector(A,y0,t_end,h);

f3=figure;
hold on 
plot(t, y_explicit(1,:), DisplayName="explicit")
plot(t, y_implicit(1,:), DisplayName="implicit")
plot(t, y_analytical(1,:), DisplayName="analytical")
legend()
title("y1- stepzize=0.01")

f4=figure;
hold on
plot(t, y_explicit(2,:), DisplayName="explicit")
plot(t, y_implicit(2,:), DisplayName="implicit")
plot(t, y_analytical(2,:), DisplayName="solution")
title("y2- stepzize=0.01")
legend()

% from the graphs, it can be observed that with smaller step sizes,
% results are getting more precise for explicit euler. However, implicit
% euler does not oscillate and differ when a small change in the step sizes
% is made.
