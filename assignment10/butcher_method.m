% function []=butcher_method(h_values,beta_values)
t_end=4;
h=0.1;
t=0:h:t_end;
y=@(t) 2*exp(t^2/2);
f=@(t,y) t*y(t);
h_values=[0;1/2;1/2;1];
beta_values=[0 0 0 0;
             1/2 0 0 0;
             0 1/2 0 0;
             0 0 1 0];
gama_values=[1/4 0 3/4];
% for i=1:length(h_size)
% q(i,1)=h?*f(t+h(i),y)
q_1=h*f(t+h*h_values(i),y+)

for i=2:length(gama_values)+1
y_i(i)=y_i(i-1)+q(i)*gama_values(i)
end