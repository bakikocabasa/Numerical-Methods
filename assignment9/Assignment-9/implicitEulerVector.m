function [z, y]= implicitEulerVector(A, y,t_end, h)

z_1 = [];
y_1 = [];
disp('t        y1         y2');
for z = 0:h:t_end
    y = (eye(size(A)) - h*(-A))\y;
    z_1 = [z_1 z];
    y_1 = [y_1 y];
    fprintf('%f \t %f \t %f \n',z,y(1),y(2))
end
z = z_1;
y = y_1;
end