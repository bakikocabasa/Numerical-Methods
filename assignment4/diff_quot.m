function difference_quotient = diff_quot(f,x,h,method)

if method=="forward"
    xForward=x(1:end-1);
    xForward2=x(2:end);
    dFForward=(f(xForward2)-f(xForward))/h;
    difference_quotient=dFForward;
    plot(xForward,dFForward,'k');
elseif method=="backward"
    xBackward=x(2:end);
    xBackward2=x(1:end-1);
    dFBackward=(f(xBackward)-f(xBackward2))/h;
    difference_quotient=dFBackward;
    plot(xBackward,dFBackward,'g');

elseif method=="central"
    xCentral=x(2:end-1);
    xCentral2=x(3:end);
    xCentral3=x(1:end-2);
    dFCenteral=(f(xCentral2)-f(xCentral3))/(2*h);
    difference_quotient=dFCenteral;
    plot(xCentral,dFCenteral,'r')

end


end
