clear all

A = [24     0    17   -27   -14     9   -22     8    11    16     9    -7   -12   -10    26    -3    -4    -3    27   2    23   17   -10    16   10     7    -3   -30     6     6    9    10    6    8    4    1   -3     -2     5    1    9    8    3    0    -8   -5   1    0   1   6    -3    2    -2   5   6    12     19     7   11    4    16    10     13     9];
k = 3;

i=1;
liczba_decyzji = 0;
%obliczanie potrzebnych liczby decyzji
for i=k:-1:1
    liczba_decyzji = liczba_decyzji + (4^(i-1));
end
wektor_aktualny=A;
n=1;
%petla glowna rozwiazujaca problem
for j=k:-1:1
    disp(['Poziom ' num2str(j)]);
    dlugosc=length(wektor_aktualny);
    m=1;
    for i=1:4:dlugosc
        %macierz wynikow
        B=[wektor_aktualny(i), wektor_aktualny(i+1); wektor_aktualny(i+2), wektor_aktualny(i+3)]
        %obliczanie punktu siodlowego
        %[wektor_aktualny(m), D1, D2]=siodlowy(B,'minmax');
        %zapis danych potrzebnych do znalezenia decyzji graczy
        D(1,n) = D1;
        D(2,n) = D2;
        D(3,n) = wektor_aktualny(m);
        m=m+1;
        n=n+1;
    end
    wektor_aktualny=wektor_aktualny(1:m-1);
end
t = ntree(2,(k-j+1)*2);
    plot(t);
%obliczanie wykonywanych decyzji po kolei
Dk = [D(:,liczba_decyzji)];
lb = 1;
Dtemp2 = [];
for i=2:k
    lb = lb + 4^(i-1);
    D_temp = D(:, (liczba_decyzji - lb +1):(liczba_decyzji - lb + 4^(i-1)));
    for(j=1:size(Dk,2))
        if(Dk(1,j) == 1)
            D_temp = D_temp(:, 1:(size(D_temp,2)/2));
        else
            D_temp = D_temp(:, (size(D_temp,2)/2)+1:size(D_temp,2));
        end
        if(Dk(2,j) == 1)
            D_temp = D_temp(:, 1:(size(D_temp,2)/2));
        else
            D_temp = D_temp(:, (size(D_temp,2)/2)+1:size(D_temp,2));
        end
    end
    Dk = [Dk D_temp];
end
disp('Kolejne decyzje graczy to:');
disp(Dk(1:2,:));
%rysowanie drzewa dla rozwiazania gry
Drzewo = ntree(2,0);
x = 0;
for i=1:k
    Drzewo = nodesplt(Drzewo, x);
    x = x*2 + Dk(1,i);
    Drzewo = nodesplt(Drzewo, x);
    x = x*2 + Dk(2,i);
end
plot(Drzewo);
wynik=wektor_aktualny(1);
disp(['Wynik gry to:' num2str(wynik)]);
