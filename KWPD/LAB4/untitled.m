clc;
clear all;
K=3;
A = [24 0 17 -27 -14 9 -22 8 11 16 9 -7 -12 -10 26 -3 -4 -3 27 2 23 17 -10 16 10 7 -3 -30 6 6 9 10 6 8 4 1 -3 -2 5 1 9 8 3 0 -8 -5 1 0 1 6 -3 2 -2 5 6 12 19 7 11 4 16 10 13 9];
program(K, A)
function [led, dec] = program(K, A)
if(length(A) == 4^K)
    lvl = zeros(K, 4^K);
    lvl(K,:) = A;
    cnt = 1;
    A = zeros(2,2);
    for k = K : -1: 1
        for i = 1 : 4 : 4^k
            A(1,1) = lvl(k,i);
            A(1,2) = lvl(k,i+1);
            A(2,1) = lvl(k,i+2);
            A(2,2) = lvl(k,i+3);
            [player1, maks, player2, mini] = Lab1(A);
            lvl(k-1,cnt) = A(player1,player2);
            cnt = cnt + 1;
            A
        end
        cnt = 1;
    end
    A(1,1) = lvl(1,1);
    A(1,2) = lvl(1,2);
    A(2,1) = lvl(1,3);
    A(2,2) = lvl(1,4);
    [player1, maks, player2, mini] = Lab1(A);
    led = A(player1, player2);
    dec = zeros(k,2);
    for k = 1 : K
        for i = 1 : 4 : 4^k
            A(1,1) = lvl(k,i);
            A(1,2) = lvl(k,i+1);
            A(2,1) = lvl(k,i+2);
            A(2,2) = lvl(k,i+3);
            if (A(1,1) == led)
                dec(k,:) = [1 1];
            end
            if (A(1,2) == led)
                dec(k,:) = [1 2];
            end
            if (A(2,1) == led)
                dec(k,:) = [2 1];
            end
            if (A(2,2) == led)
                dec(k,:) = [2 2];
            end
        end
    end
    plot(ntree(2,K*2));
    pos = 0;
    T = ntree(2,0);
    for i = 1 : K
        T = nodesplt(T,pos);
        pos = pos*2 + dec(i,1);
        T = nodesplt(T,pos);
        pos = pos*2 + dec(i,2);
    end
    plot(T);
else
    disp('nieprawidlowy wektor wyplat');
end
end

function [gracz1, maks, gracz2, mini] = Lab1(A)
maksy = max(A');
miny = min(A);
maks = min(maksy); %poziom bezpieczeństwa dla minimalizującego
mini = max(miny); %poziom bezpieczeństwa dla maksymalizującego
for i = 1 : length(maksy)
    if(maksy(i)== maks)
        % disp('gracz pierwszy(minimalizuje) gra: ');
        % disp(i);
        gracz1 = i;
    end
end
for i = 1 : length(miny)
    if(miny(i)== mini)
        % disp('gracz drugi(maksymalizuje) gra: ');
        % disp(i);
        gracz2 = i;
    end
end
if(maks == mini)
    disp('istnieje punkt siodłowy');
end
end