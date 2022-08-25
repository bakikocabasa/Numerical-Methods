function q = subintervals(f,a,b,J)
    
    q = zeros(length(J),1);
    % i.e. from 0 to 1 with intervals (J) of 10, n = 0.1
    %n = (b - a)./ J;
    for j = 1:length(J)
        n = (b - a)/ J(j);
        for i = a:n:b
            if i+n<b
                q(j) = q(j) + trapez(f,i,i+n);
            else
                q(j) = q(j) + trapez(f,i,b);
            end
        end
    end
end