function cobweb(f,x0_1)
snoozeTime=0.1;
initVal=x0_1;
nStart=2;
nStop=19;
h=figure(1);                    % Without these two lines, a MATLAB 
set(h,'doublebuffer','on');     % bug gives an annoying flicker.

xMin = min(x0_1); xMax = max(x0_1);
xGrid = linspace(xMin, xMax, 100);  
plot(xGrid,f(xGrid),'r-',...
     'LineWidth',2);            % Plot the user-specified function.
hold on
plot(xGrid, xGrid,'k-');        % Plot the diagonal.
% axis([xMin xMax xMin xMax]);    % Scale the picture, and 
% axis('square');                 % ensure the plot is square.

% wBar = waitbar(0, 'Plotting the iterates...');

for n = nStart:nStop

    for k = 1:length(initVal(1))
        if (n >= 1) 
            xplot = [x0_1(n-1,k) x0_1(n,k)];
            yplot = [x0_1(n,k) x0_1(n,k)];
            plot(xplot,yplot,'b:')  % Draw horizontal part of cobweb.
            pause(snoozeTime)
        end
        if (n <= nStop)
            xplot = [x0_1(n,k) x0_1(n,k)];
            yplot = [x0_1(n,k) x0_1(n+1,k)];
            plot(xplot,yplot,'b')   % Draw vertical part of cobweb.
            pause(snoozeTime)
        end
    end
end 
% close(wBar);
hold off