function [alfa] = lagrange_coeffs(x,y)

%% take the size of given input
[m1,n1]=size(x);
[m2,n2]=size(y);

%% size needs to match, every node has related y values & we only accept
%column vectors. It means each time we solve one lagrange
if m1>1 || m2>1 
    error('Error! No column-vectors as input!');
end

if n2~=n1;
    error('Error! Dimension of input vectors don''t agree!');
end

%% 
n=n1;
L=zeros(n,n);

for i=1:n
      
    x_temp=x;
    x_temp(i)=[]; 
    % interpolation polynomial
    L(i,:)=poly_prod(-x_temp);
    L(i,:)=y(i)*L(i,:)/poly_diff(x(i),x_temp); 
   
end
alfa=sum(L,1); 
interval=linspace((min(x)),max(x),1000);
plot(interval,polyval(alfa,interval))
xlim([min(x),max(x)]);
% ylim([min(y),max(y)]);
end

%% multiplys two given values, interpolationaly
function [x_out] = poly_diff(x0,x)
[~,n]=size(x);
x_out=1;
for i=1:n
    
    x_out=x_out*(x0-x(i));
    
end
end
%% here is to find the coefficients. Conv function is widely used to create polynomial expressions in matrix form
function [p] = poly_prod(p1)
[~,n]=size(p1);
p=zeros(1,n+1);
p(1)=1;
for j=1:n
    
    p=conv(p, [1, p1(j)]);
    
end
p(n+2:end)=[];


end

% p1(1) is the coefficient of x^(n) !! n is the degree of the equation
% p = a(N)*x^(N-1)+...+a(0)
