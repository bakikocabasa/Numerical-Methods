function approx_integral_midpoint = Romberg_midpoint(f,a,b,n)

%n is the step size, n-1 steps are needed
% approx_integral=zeros(n,n);
J=2;
   
for i=1:n
       approx_integral_midpoint(i,1)=summed_midpoint(f,a,b,J); 
   J=J*2;
end

for col=2:n

    k=col-1;
for row=1:(n-col+1)
        
        approx_integral_midpoint(row,col)=((4^(k))*approx_integral_midpoint(row+1,col-1)-approx_integral_midpoint(row,col-1))/(4^(k)-1);
end
end




end

