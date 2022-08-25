function [y] = implicitEulerVector(A,y0,t_end,h)

t=0:h:t_end;

y=zeros(length(y0), length(t));

y(:,1)=y0;
%Euler backward method: y_k+1 = y_k + f(t_k+1, y_k+1)
%y_k+1=(I-(-h*A)))^-1 * y_k = B * y_k
B=inv(eye(length(A))-(-h*A));

for i=1:length(t)-1
    %Euler backward method: y_k+1 = y_k + f(t_k+1, y_k+1)
    y(:,i+1) = B*y(:,i);
end

end