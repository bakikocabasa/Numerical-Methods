%this assignment isn't finished.

y=@(t) 2*exp(t^2/2);
t_end=4;
h=1;
y_analytical = zeros(1,t_end);
i=0;
for ti=0:h:t_end
    i=i+1;
    y_analytical(1,i) = y(ti);
end

butcher_method(h_values,beta_values)