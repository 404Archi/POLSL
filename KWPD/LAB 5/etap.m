function [wynikA,wynikB,pgr,dgr] = etap(A, B)
disp '==========================================='
disp 'Rozwiazuje podgre dla:';
A
B
k = min(A);
Nashe = [];
licznik = 0;
for i=1:size(k')
    l = find(k(i) == A(:,i));
    for j=1:size(l);
        wiersz = B(l(j),:);
        m = min(wiersz);
        m = find(m == wiersz');
        m = m';
        for q=1:length(m)
            qq = m(q);
            xx = l(j);
            if(qq == i)
                licznik = licznik+1;
                wybor = [xx qq];
                wynik = [A(xx, qq) B(xx, qq)];
                Nashe = [Nashe; wybor];
            end
        end
    end
end
if licznik == 1
    wybor = wybor
    wynik = wynik
    pgr = wybor(1);
    dgr = wybor(2);
    wynikA = wynik(1);
    wynikB = wynik(2);
    return;
end
for i=1:size(Nashe)
    k=0;
    strat1 = Nashe(i,:);
    wynik1 = [A(strat1(1), strat1(2)) B(strat1(1), strat1(2))];

    for j=1:size(Nashe)
        if(i==j)
            continue;
        end
        strat2 = Nashe(j,:);
        wynik2 = [A(strat2(1), strat2(2)) B(strat2(1), strat2(2))];
        if find((wynik1>wynik2) ~= 0)
            k=1;
            break;
        end
    end
    if k==0
        disp 'Strategia dopuszczalna '
        strat1
        pgr = strat1(1);
        dgr = strat1(2);
        wynikA = A(pgr, dgr);
        wynikB = B(pgr, dgr);
        return;
    end
end
max1 = max(A');
S1 = min(max1);
i = find(max1 == S1);
pgr = i(1);
max1 = max(B);
S1 = min(max1);
i = find(max1 == S1);
dgr = i(1);
wynikA = A(pgr, dgr);
wynikB = B(pgr, dgr);
disp 'Strategia minimaxowa';
strat = [pgr dgr]
wynik = [wynikA wynikB]
end