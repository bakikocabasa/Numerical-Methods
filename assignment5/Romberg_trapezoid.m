function [approx_integral_trapezoid] = Romberg_trapezoid(f,a,b,n)

%n is the step size, n-1 steps are needed
% approx_integral=zeros(n,n);
for i=1:n
    J(1,i)=2^i;
end
   
   approx_integral_trapezoid=subintervals(f,a,b,J); 


for col=2:n

    k=col-1;
for row=1:(n-col+1)
        
        approx_integral_trapezoid(row,col)=((4^k)*approx_integral_trapezoid(row+1,col-1)-approx_integral_trapezoid(row,col-1))/(4^k-1);
end
end




end