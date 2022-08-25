function[zero2d,n_stored] = newton2d(f,JF,x0,output)
if nargin == 3   % if the number of inputs equals 2
  output = "blank"; % then make the third value, z, equal to my default value, 5.
end
syms x1;  
syms x2;  
error=1e-6;
tol=10;
n_plus_one=[0;0];
n=x0;
steps=1;
n_stored=n;
if output=="full"
    while tol>=error
        
        A=eval(subs(JF,{x1,x2},{n(1),n(2)})); %by using sub I change the x1 and x2 values with the initial condition values
        b=eval(subs(f,{x1,x2},{n(1),n(2)})); %by using eval function, I change the structure of the function from sym into mat format.
    
        n_plus_one=n-A\b;       %by using mldivide we calculate the matrix division
        
        tol=norm(n_plus_one-n)/norm(n); %finding the error in matrix form
        
        n=n_plus_one; %update the iterative value
        n_stored(:,steps)=n; %store the matrixes of way points
        steps=steps+1; %count the steps for diagnose if needed
        if steps==200 %safety feature
            break
        end
    end
    zero2d=n; %send the value outside of the function

elseif output=="diverging" %check whether if it diverges or not
    while tol>=error
        n=[1000;219391231]; %providing a different initial point to see how it reacts.
        A=eval(subs(JF,{x1,x2},{n(1),n(2)}));
        b=eval(subs(f,{x1,x2},{n(1),n(2)}));
    
        n_plus_one=n-A\b;
        
        tol=norm(n_plus_one-n)/norm(n);

       
        n=n_plus_one;
        n_stored(:,steps)=n;
        steps=steps+1;
        if steps==200 %safety feature
            break
        end
    end
    zero2d=n;
else

zero2d=vpasolve(f); %numerical solution for syms oriented function can be solved by using vpasolve


end

