function [z, y]= explicitEulerVector(A, y,t_end, h)

z_1 = [];
y_1 = [];
disp('t         y1          y2');
y0 = y;
for z = 0:h:t_end
    y = y0 + (h*(-A)*y);
    z_1 = [z_1 z];
    y_1 = [y_1 y];
    fprintf('%f \t %f \t %f \n',z,y(1),y(2))
    y0 = y;
end
z = z_1;
y = y_1;
end