clc;
clear all;
close all;
K=3;
% wyplaty = randi([0,30],1,4^K);
% wyplaty = [17    20    15    12];
wyplaty = [24     0    17   -27   -14     9   -22     8    11    16     9    -7   -12   -10    26    -3    -4    -3    27   2    23   17   -10    16   10     7    -3   -30     6     6    9    10    6    8    4    1   -3     -2     5    1    9    8    3    0    -8   -5   1    0   1   6    -3    2    -2   5   6    12     19     7   11    4    16    10     13     9];
program( K, wyplaty )

function [ przewaga, decyzje ] = program( K, wyplaty )
if(length(wyplaty) == 4^K)
    poziom = zeros(K, 4^K);
    poziom(K,:) = wyplaty;
    licznik = 1;
    A = zeros(2,2);

    for k = K : -1 : 2
        for i = 1 : 4 : 4^k
            A(1,1) = poziom(k,i);
            A(1,2) = poziom(k,i+1);
            A(2,1) = poziom(k,i+2);
            A(2,2) = poziom(k,i+3);
            
            [gracz1, maks, gracz2, mini] = Lab1(A);
            poziom(k-1,licznik) = A(gracz1,gracz2);
            licznik = licznik + 1;
            A

        end
        
        licznik = 1;
    end
    A(1,1) = poziom(1,1);
    A(1,2) = poziom(1,2);
    A(2,1) = poziom(1,3);
    A(2,2) = poziom(1,4);
   
    [gracz1, maks, gracz2, mini] = Lab1(A);
    przewaga = A(gracz1,gracz2);
    decyzje = zeros(k,2);
    for k = 1 : K
        for i = 1 : 4 : 4^k
            A(1,1) = poziom(k,i);
            A(1,2) = poziom(k,i+1);
            A(2,1) = poziom(k,i+2);
            A(2,2) = poziom(k,i+3);
            if (A(1,1) == przewaga)
                decyzje(k,:) = [1 1];
            end
            if (A(1,2) == przewaga)
                decyzje(k,:) = [1 2];
            end
            if (A(2,1) == przewaga)
                decyzje(k,:) = [2 1];
            end
            if (A(2,2) == przewaga)
                decyzje(k,:) = [2 2];
            end
        end
    end
    % generacja pełnego drzewa
    plot(ntree(2,K*2));
    % generacja ścieŜki podjętych decyzji
    pozycja = 0;
    T = ntree(2,0);
    for i = 1 : K
        T = nodesplt(T,pozycja);
        pozycja = pozycja*2 + decyzje(i,1);
        T = nodesplt(T,pozycja);
        pozycja = pozycja*2 + decyzje(i,2);
    end
    plot(T);
else
    disp('nieprawidlowy wektor wyplat');
end

end