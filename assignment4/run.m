%exercise 4.1
clc
clear all
close all
f = @(x) sin(x);

J=2; % we start from 2 because J=1 does no provide an interval
count=0;
safe_guard=0; % safeguard value is set.
while (count<10)
    count=0;
    for i=1:11 %just because we want to have 10 error values, we need at least 10+1 values.
        
        q2(i)=subintervals2(f,0,pi,J); %for everygiven J values we start finding the integrals, after every iteration, J is increased by value 1.
        J=J+1;
    end
    
    for j=1:10
        error(1,j)=abs(q2(j)-q2(j+1)); %have the error value for each iteration 
        
    if error(j)<=1e-4 %if error threshold has been passed, we start count, if it is not equal to 10, we keep creating new batches to see if they have 10 error cases. 
        %till that moment, we do not exit while loop.
        count=count+1;
    end
    
    end
    safe_guard=safe_guard+1;
    error_stored(safe_guard,:)=error(1,:);
    q2_stored(safe_guard,:)=q2(1,:);
    if safe_guard==100 %safeguard is being checked, if the error numbers does not exceed and the program stuck, then safeguard breaks the loop. Verified.
    break
    end

end
% store mxn matrix into 1xY matrix
all=reshape(q2_stored',1,[]); % i want to use a raw matrix to reach the values easily.
all2=all'; % all iteration values are stored at one matrix

for p=1:length(all2)
    distance_vector(p,1)=abs(all2(p,1)-all2(length(all2),1));

end
%because J starts from 2, we have 154 values in the matrix, after the last epoch, we add +1 to J but there is no run for the value of J=156 .

%%
plot_j=linspace(2,J-1,J-2);
figure
plot(plot_j,distance_vector,'o')
grid on;
xlabel('J  [Intervals]');
ylabel('Distance [abs(J-th value-last value)]');
% Draw t axis
yline(0, 'LineWidth', 2);
% Find min y value and it's index.
[minSignal, indexOfMin] = min(distance_vector);
% Find time value at that min y value.
tMin = plot_j(indexOfMin);
xline(tMin, 'Color', 'r', 'LineWidth', 2);
textLabel = sprintf(' Min of %.2f at J=%f', minSignal, tMin);
text(tMin, minSignal, textLabel, 'fontSize', 15, 'Color', 'r', 'VerticalAlignment','top')
% Find max y value and it's index.
[maxSignal, indexOfMax] = max(distance_vector);
% Find time value at that max y value.
tMax = plot_j(indexOfMax);
xline(tMax, 'Color', 'r', 'LineWidth', 2)
textLabel = sprintf(' Max of %.2f at J=%f', maxSignal, tMax);
text(tMax, maxSignal, textLabel, 'fontSize', 15, 'Color', 'r', 'VerticalAlignment','bottom')

%%
% exercise 4.2
q=figure;
for N=2:100

x=linspace(0,2*pi,N);
h=x(2)-x(1);

difference_quotient_central = diff_quot(f,x,h,"central");
hold on
difference_quotient_forward = diff_quot(f,x,h,"forward");

difference_quotient_backward = diff_quot(f,x,h,"backward");

legend('Central','Forward','Backward')
% xlabel('')
% ylabel('')
drawnow


end
hold off

%%

x_t=linspace(0,2*pi,101); % to match with the exact x values in the interval, the length is chosen as 101. It does not matched with 100.
x_t2=x_t(2:end-1);
difference_quotient_central_graph = diff_quot(f,x_t,h,"central");
figure
plot(x_t2,f(x_t2))
grid on;
fontSize = 10;
xlabel('x', 'FontSize', fontSize);
ylabel('y=sinx(x)', 'FontSize', fontSize);
 set(gca,'XTick',0:pi/2:2*pi) 
 set(gca,'XTickLabel',{'0','pi/2','pi','3*pi/2','2*pi'}) % to have the values on the x axis as pi oriented.
% finding the tangent lines for given x points
tangent_line(0,x_t,f,difference_quotient_central_graph);
tangent_line(pi/2,x_t,f,difference_quotient_central_graph);
tangent_line(3*pi/2,x_t,f,difference_quotient_central_graph);

% we do not have exact tangents for the given values because our method is
% to approach the slope values. But it seems they are a right approach.
