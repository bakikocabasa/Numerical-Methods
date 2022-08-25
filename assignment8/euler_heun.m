function [y,t_eul_heun] = euler_heun(f,y_0,t_end,h)

n = t_end/h;
t_eul_heun = 0:h:t_end;
y = zeros (1, n+1);

y(1) = y_0;

for i = 2:n+1
    y(i) = y(i-1) + 0.5 *h* (f(t_eul_heun(i-1),y(i-1)) + f((t_eul_heun(i-1) + h),y(i-1) + h*f(t_eul_heun(i-1),y(i-1))));
end

