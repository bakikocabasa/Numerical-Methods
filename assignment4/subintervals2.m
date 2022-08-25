function integral = subintervals2(f,a,b,J)
    
h=(b-a)/J; %granularity
x=linspace(a,b,J); %create x values for given interval for length of J

for i = 1:J-1
    I(i)= (h/6)*(f(x(i))+(4*f((x(i)+x(i+1))/2))+f(x(i+1))); % calculating the subinterval values
end
% Calculating the integral
integral = sum(I);
end


