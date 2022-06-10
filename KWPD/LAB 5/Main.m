A= [20    23     2   -18   -18   -12    17   -13    16   -13    22    -8   -15   -13     6    -1    -8    17     4     3    21  -11    13    13    -6     3   -22   -23     2    14    22   -19     4    -2   -25    -8   -17    15   -10     1   -17     5  -12     8    10    13    -3   -21   -14    21   -18    17     2    25   -22    -3   -20    24   -25    14    16    19   -21 -5];
B= [-12    15    -3    21   -16   -12   -18   -19    19     4     3   -18    18     6    -8     1    -5   -22   -13   -19   -16  -13    -4   -23    21    23     0    -1    -8    20    -7   -20    14    -6   -13    -5   -21   -19    23    23     4   -22   -14    -7    16   -25   -23   -17     8    12     8    -3     2   -10    12   -16    10   -16    -7     6    14   -21    22   14];
k = 3;

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


