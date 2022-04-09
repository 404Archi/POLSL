 
A =    [[1,1,3,2,4,0];
        [1,0,2,3,4,1];
        [3,4,2,0,1,3];
        [2,1,2,3,4,0];
        [1,3,1,2,4,3];
        [4,2,1,0,2,3]]
s = size(A);
n = s(1); %wiersze
m = s(2); %kolumny
disp 'Gracz 1:'
% gracz 1
A = A';
b = ones(m, 1);
lb = zeros(n, 1);
f = (-ones(1, n));
[x,fval] = linprog(f,A,b,[],[],lb);
fval = -fval;
y = x/fval
S = 1/fval;
disp 'Gracz 2:'
% gracz 2 
A = A';
A = -A;
b = -ones(1, n);
lb = zeros(m, 1);
f = ones(1, m);
[w,fval] = linprog(f,A,b,[],[],lb);
z = w/fval
S = 1/fval;

disp(['Punkt siodlowy to: ' num2str(S)])