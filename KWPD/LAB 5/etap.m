function [wynikA,wynikB,p_gr,d_gr] = etap(A, B)
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
for qq=1:length(m)
qqq = m(qq);
xxx = l(j);
if(qqq == i)
licznik = licznik+1;
%disp 'rownowaga nasha dla ';
wybor = [xxx qqq];
wynik = [A(xxx, qqq) B(xxx, qqq)];
Nashe = [Nashe; wybor];
end
end
end
end
if licznik == 1
wybor = wybor
wynik = wynik
p_gr = wybor(1);
d_gr = wybor(2);
wynikA = wynik(1);
wynikB = wynik(2);
return;
end
Nashe
for i=1:size(Nashe)
k=0;
strategia1 = Nashe(i,:);
wynik1 = [A(strategia1(1), strategia1(2)) B(strategia1(1), strategia1(2))];

for j=1:size(Nashe)
if(i==j)
continue;
end
strategia2 = Nashe(j,:);
wynik2 = [A(strategia2(1), strategia2(2)) B(strategia2(1), strategia2(2))];
if find((wynik1>wynik2) ~= 0)
k=1;
break;
end
end
if k==0
disp 'Strategia dopuszczalna '
strategia1
p_gr = strategia1(1);
d_gr = strategia1(2);
wynikA = A(p_gr, d_gr);
wynikB = B(p_gr, d_gr);
return;
end
end
max1 = max(A');
S1 = min(max1);
i = find(max1 == S1);
p_gr = i(1);
max1 = max(B);
S1 = min(max1);
i = find(max1 == S1);
d_gr = i(1);
wynikA = A(p_gr, d_gr);
wynikB = B(p_gr, d_gr);
disp 'Strategia minimaxowa';
strategia = [p_gr d_gr]
wynik = [wynikA wynikB]
end