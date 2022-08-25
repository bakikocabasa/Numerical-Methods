function approx_midpoint = summed_midpoint(f,a,b,J)
h=(b-a)/J;
%x are your evaluation points

approx_midpoint=0;
for x=a:h:(b-h)
%This evaluates the function f, which is another matlab function
approx_midpoint=approx_midpoint+(f((x+(x+h))/2))*h;
%you can just add up the vector y and multiply by h
end
end