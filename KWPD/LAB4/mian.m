clc;
clear all;

K=3;

A=[4 49 25 45 14 1 33 27 26 9 44 47 49 31 17 26 23 17 18 4 20 24 12 35 7 47 41 41 24 23 33 21 2 2 46 24 19 50 27 45 18 5 21 33 49 4 35 24 32 7 26 14 49 47 40 17 10 18 34 22 45 20 42 37]


program(K, A)

function [led, dec] = program(K, A)
if(length(A) == 4^K)
    lvl = zeros(K, 4^K);
    lvl(K,:) = A;
    cnt = 1;
    A = zeros(2,2);

    for k = K : -1 : 2
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
    for k = K : -1: 1
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