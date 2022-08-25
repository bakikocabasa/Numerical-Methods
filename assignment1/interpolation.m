%% sectian a
clc
clear all
%% section b
x=linspace(-3,3);
y=1./(x.^2+1);

plot(x,y)
title('Runge function')
xlabel('x')
ylabel('y')

%% section c

n1=linspace(-2,2,3);
n2=linspace(-2,2,5);
n3=linspace(-2,2,7);
n11=linspace(-2,2);
n22=linspace(-2,2);
n33=linspace(-2,2);

y1=1./(n1.^2+1);
y2=1./(n2.^2+1);
y3=1./(n3.^2+1);

p1 = polyfit(n1,y1,2);
p2 = polyfit(n2,y2,4);
p3 = polyfit(n3,y3,6);
y11 = polyval(p1,n11);
y22 = polyval(p2,n22);
y33 = polyval(p3,n33);

t = tiledlayout(4,1);
ax1=nexttile;
plot(x,y)
title('Runge Function')

ax2=nexttile;
hold on
plot(n1,y1,'o')
plot(n11,y11)
hold off

title('Polynomial interpolation of Runge function(3)')
xlim([-3 3])
ylim([-1 1.5])

ax3=nexttile
hold on
plot(n2,y2,'o')
plot(n22,y22)
hold off
title('Polynomial interpolation of Runge function(5)')
xlim([-3 3])
ylim([-1 1.5])
ax4=nexttile
hold on
plot(n3,y3,'o')
plot(n33,y33)
hold off
title('Polynomial interpolation of Runge function(7)')
xlim([-3 3])
ylim([-1 1.5])



