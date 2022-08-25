clc; 
clear all; 
close all;
format long
functn = @(x) 2*sin(x) -x %Starting function %Starting function
interval = 0.001; %Small x-step used to approximate the function derivative
x = 0.01:0.01:1; %Range of x
dydx = (functn(x+interval) - functn(x))/interval; %Definition of a derivative
Root_value = 0.069; % Function value
ytolerance = 1e-6; % The convergence tolerance
initial_guess = 2; % The initial guess for the location of the root x0
x = initial_guess; %Setting x to be the initial guess, using initial guess to compute the function
yerror = Root_value-functn(x); %Computing error
counter = 1; %A basic loop counter
previous_x = 0; %Setting previous x value to be empty, "0"
t = 0; %Iteration counter
 xx = 0:0.1:1;
fprintf('Iteration#\t\t x\t\tf(x)\t\terror\n') %Output headers
while abs(yerror)>ytolerance %While the absolute value of the error > error tolerance, the loop continues
    
    dydx = (functn(x+interval)-functn(x))/interval; %Definition of a derivative
    fx=functn(x); %Renaming function to something simpler
    dx = fx/dydx; %Original function divided by the derivative
    previous_x=x; %Setting the previous x value to the current x value to progress the loop
    x=x-dx; %Definition of Newton's Method
    yerror = Root_value - functn(x); %Recalculating error
    counter = counter+1; %A basic loop counter


    plot(xx,functn(xx),'k') %Plotting original funtion
    hold on
    plot(initial_guess,functn(initial_guess), 'k', "Marker","o") %Plotting the initial guess value
    plot(x,functn(x), 'r', 'Marker', "*") %Plotting approximated root value
        if previous_x==x %Once the previous x value equals the current x value, the loop breaks, and the program ends
            break
        end
        
    t = t+1; %Iteration counter
    fprintf('%d\t\t\t%f\t%f\t%f\n',t,x,fx,yerror) %Outputting all values at each iteration
    
% %Plotting
% xx = 0:0.1:1;
% figure
% plot(xx,functn(xx),'k') %Plotting original funtion
% hold on
% plot(initial_guess,functn(initial_guess), 'k', "Marker","o") %Plotting the initial guess value
% while 
%     % some code
%     plot(x,functn(x), 'r', 'Marker', "*") %Plotting approximated root value
end
% hold off