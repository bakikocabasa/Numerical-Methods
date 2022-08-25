function output=newton1d(f,x_0)                 %set starting value and the function
nmax=20;                                       %set max number of iterations
x_n0(1,1)=x_0;

for i=1:nmax                                  
    x_n1(i,1)=x_n0(i,1)- (x_n0(i,1)^3+x_n0(i,1)-1)/(3*x_n0(i,1)^2 + 1);   %compute next iterate              

    x_n0(i+1,1)=x_n1(i,1);

end                                            %end of while-loop

output=x_n1(end,1);



end