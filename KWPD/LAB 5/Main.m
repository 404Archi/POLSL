A=;
B=;
K = 3;

decyzje = [];
% i - numer aktualnego etapu zaczynajac od konca
for i=k:-1:1
A_new = [];
B_new = [];
% j - numer aktualnego podetapu
for j=1:(4^(i-1))
index = ((j-1)*4)+1;
a(1,1) = A(index);
a(1,2) = A(index+1);
a(2,1) = A(index+2);
a(2,2) = A(index+3);

b(1,1) = B(index);
b(1,2) = B(index+1);
b(2,1) = B(index+2);
b(2,2) = B(index+3);
[wynikA, wynikB, p_gr, d_gr] = etap(a, b);
A_new(j) = wynikA;
B_new(j) = wynikB;
decyzje(i,:) = [p_gr d_gr];
end
A = A_new
B = B_new
end
% drzewo
drzewo = ntree(2, 0);
index = 0;
drzewo = nodesplt(drzewo, index);
for i=1:(k-1)
index = index + decyzje(i,1);
drzewo = nodesplt(drzewo, index);
index = index*2;
index = index + decyzje(i,2);
drzewo = nodesplt(drzewo, index);
index = index*2;
end
index = index + decyzje(k,1);
drzewo = nodesplt(drzewo, index);
plot(drzewo);
decyzje


