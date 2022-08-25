
clear
clc
clf
% domain descritization
alpha = 1;
xmin = 0; %boundry 1
xmax = 1; %boundry 2
N = 101; 
dx = (xmax-xmin)/(N-1); % needs to be 0.01
x = xmin:dx:xmax;
dt = 4.0812E-5; 
tmax = 0.25;
t = 0:dt:tmax;
% problem initialization
phi0 = ones(1,N)*10;
phiL = 0; %boundry condition for temp
phihalfL=10;
phiR = phiL;
% solving the problem
r = alpha*dt/(dx^2) % for stability, must be 0.5 or less
for j = 2:length(t) % for time steps
    phi = phi0;        
    for i = 1:N % for space steps
        if i == 1 || i == N 
            phi(i) = phiL;
        elseif i==N/2
            phi(i) = phihalfL;
        else
            phi(i) = phi(i)+r*(phi(i+1)-2*phi(i)+phi(i-1));
        end
    end
    phi0 = phi;
    stored(j,:)=phi;

    plot(x,phi0)
    shg
    pause(0.005)
end
final_temp_0_25=phi;

%% second part for explicit
first_values=stored(2,:)';
this_part_needs_to_be_finded=1; % investigate how to find the stiffness matrix
[y] = explicitEulerVector(this_part_needs_to_be_finded,first_values,tmax,dt)