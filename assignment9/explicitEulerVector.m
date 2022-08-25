function [y] = explicitEulerVector(A,y0,t_end,h)

t=0:h:t_end;

y=zeros(length(y0), length(t));
y(:,1)=y0;

for i=1:length(t)-1
    %Euler forward method: y_k+1 = y_k + f(t_k, y_k)
    y(:,i+1) = y(:,i)+ h*(-A*y(:,i));
end

end