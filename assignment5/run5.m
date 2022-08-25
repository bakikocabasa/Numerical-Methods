clc
clear all
a=0;
b=1;
f = @(x) exp(x).*cos(x); %function is defined

%% comparison after 2 steps
n2=2;
n2_integral_trapezoid=Romberg_trapezoid(f,a,b,n2);
n2_integral_midpoint=Romberg_midpoint(f,a,b,n2);






n_trapezoid=1;
approx_integral_trapezoid=Romberg_trapezoid(f,a,b,n_trapezoid); %get the first integral approx values

absolute_integral=integral(f,a,b); %get the absolute integral value

error_trapezoid=abs(approx_integral_trapezoid(1,end)-absolute_integral); % get the first error
safe_guard=1; %set the safeguard for counting.
while error_trapezoid>1e-6 %while error is bigger than 1e-6, it keeps increasing the n value and find the romberg trapezoidal integral again and again
n_trapezoid=n_trapezoid+1;
approx_integral_trapezoid=Romberg_trapezoid(f,a,b,n_trapezoid); %find the trapezoidal romberg integral

error_trapezoid=abs(approx_integral_trapezoid(1,end)-absolute_integral); %compare the best approximation and the absolute integral value. Get the error.

safe_guard=safe_guard+1; %safeguard value will be increased after each iteration
error_stored_trapezoid(safe_guard,:)=error_trapezoid(1,1); %store the error for later investigation
integral_stored_trapezoid{safe_guard,1}=approx_integral_trapezoid; %store the integral approximation values for later investigation
    if safe_guard==100 %safeguard is being checked, if the error numbers does not exceed and the program stuck, then safeguard breaks the loop. Verified.
        break
    end
    
end

fprintf('Extrapolation steps for Romberg Trapezoidal Rule is: %0.f \n',n_trapezoid)

%% Romberg midpoint rule
n_midpoint=1;
approx_integral_midpoint=Romberg_midpoint(f,a,b,n_midpoint); 

error_midpoint=abs(approx_integral_midpoint(1,end)-absolute_integral); 
safe_guard=1; 
while error_midpoint>1e-6 
n_midpoint=n_midpoint+1;
approx_integral_midpoint=Romberg_midpoint(f,a,b,n_midpoint); 

error_midpoint=abs(approx_integral_midpoint(1,end)-absolute_integral); 

safe_guard=safe_guard+1; 
error_stored_midpoint(safe_guard,:)=error_midpoint(1,1); 
integral_stored_midpoint{safe_guard,1}=approx_integral_midpoint;
    if safe_guard==100 
        break
    end
    
end

fprintf('Extrapolation steps for Romberg Midpoint Rule is: %0.f \n',n_midpoint)