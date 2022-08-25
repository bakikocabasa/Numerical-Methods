clc
clear all
% testing
%% question 3 part a
%% take the p1 and p2 variables from the lagrange_coeffs
% [pl] = lagrange_coeffs([-1 0 1 2],[2 1 0 1])
% 
% [p2] = lagrange_coeffs([0 1 5/4 3],[1/2 2 0 1/2])

%% take manually solved results from the user via User Interface(UI)
check_int=0;
while check_int==0 
prompt = {'Enter [x] Matrix Values for p1:','Enter [y] Matrix Values for p1:','Enter by Hand Solved [alfa] Values for p1','Enter [x] Matrix Values for p2:','Enter [y] Matrix Values for p2:','Enter by Hand Solved [alfa] Values for p2'};
dlgtitle = 'Input/ Please Use The Given Forms';
dims = [1 35];
definput = {'[0 1 5/4 3]','[0.5 2 0 0.5]','[3.91 -16.4 13.99 0.05]','[5 6 9 11]','[12 13 14 16]','[0.05 -1.16 9.28 -11.5]'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
if isempty(answer)
    n = errordlg('To use the program, please run .exe file again','Warning');
    waitfor(n);
    errorcode=1;
    break
end
check_int=1;
end

X1 = str2num(answer{1,1});
Y1 = str2num(answer{2,1});
ALFA1 = str2num(answer{3,1});
X2 = str2num(answer{4,1});
Y2 = str2num(answer{5,1});
ALFA2 = str2num(answer{6,1});


[p1]=lagrange_coeffs(X1,Y1)
hold on
[p2]=lagrange_coeffs(X2,Y2)
hold off
title('Lagrange polynomials of f1 and f2')
xlabel('x')
ylabel('y')
legend('f1','f2')

%% compare
% while comparing, please pay attention that your given digits coincide.
% to make it easy but not really precise, we can take the first digits of
% the numbers to compare, that might cause too much generalized solution
% for the test data but only to see if the functions work, we can use it.
p1_1=floor(p1); % make the number integer
p2_1=floor(p2);
ALFA1_1=floor(ALFA1);
ALFA2_1=floor(ALFA2);

if p1_1==ALFA1_1
    fprintf('Solutions coincide for p1 \n')
else

    fprintf('Solutions do not coincide for p1 \n')
end

if p2_1==ALFA2_1
    fprintf('Solutions coincide for p2 \n')
else

    fprintf('Solutions do not coincide for p2 \n')
end


