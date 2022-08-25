function [y,t_exp_eul] = explicit_euler(f,y_0,t_end,h)
n = t_end/h;
t_exp_eul = 0:h:t_end;
y = zeros (1, n+1);


y(1) = y_0;

for i = 2:n+1
    y(i) = y(i-1) + h*f (t_exp_eul(i-1) , y(i-1));
end