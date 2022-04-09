clc
close all;
clear all;
a = imread('TestImage2.png');
authors = imread('authors.png');
[ra,ca, wa] = size(a);
[aaut, caut, waut] = size(authors);
b = imread('cienkopisy_srgb_CFA.png');
[rb,cb] = size(b);
rac = ra;
cac = ca;
bcopy = b;
rbc = rb;
st = 'Rafal_Fieroch_Marcin_Obyrtal';

[R,G,B] = imsplit(authors);

Rbin = dec2bin(R, 8);
Gbin = dec2bin(G, 8);
Bbin = dec2bin(B, 8);

% Rbinchar = convertStringsToChars(Rbin);
% Gbinchar = convertStringsToChars(Gbin);
% Bbinchar = convertStringsToChars(Bbin);

Rbin = Rbin(:);
Rbin = Rbin';

Gbin = Gbin(:);
Gbin = Gbin';

Bbin = Bbin(:);
Bbin = Bbin';

sst = dec2bin(authors,8);
dr = bin2dec(sst)
chr = convertStringsToChars(sst);
sst = sst(:);
sst = sst';
%sst = flip(sst);

k=0;
stl = length(Rbin);
for i = 1 : stl
    if (i > ra)
        rac = rac-1;
        k=k+1;

    end
    
        if (mod(a(rac,ca-i+1-ra*k, 1),2) == 1) && (Rbin(i) == 0)
           a(rac,ca-i+1-ra*k, 1) = a(rac,ca-i+1-ra*k, 1) - 1; 
        end
        if  (mod(a(rac,ca-i+1-ra*k, 1),2) == 0) && (Rbin(i) == 1)
            a(rac,ca-i+1-ra*k, 1) = a(ra,ca-i+1-ra*k, 1) + 1;   
        end
   

end

sst=  dec2bin(st,8)-'0';


sst = sst(:);
sst = sst';


k=0;
stl = length(sst);
for i = 1 : stl
    if (i > ra)
        rac = rac-1;
        k=k+1;

    end
    
        if (mod(a(rac,ca-i+1-ra*k),2) == 1) && (sst(i) == 0)
           a(rac,ca-i+1-ra*k) = a(rac,ca-i+1-ra*k) - 1; 
        end
        if  (mod(a(rac,ca-i+1-ra*k),2) == 0) && (sst(i) == 1)
            a(rac,ca-i+1-ra*k) = a(ra,ca-i+1) + 1;   
        end
   

end
figure,imshow(a);


rac = ra;

res = zeros(ra, ca);
g = zeros(stl);
for i = 1 : ra
 for j = 1 : ca
%     if (i > ra)
%         rac = rac-1;
%         k=k+1;

%     end
    %g(i, j) = [a(i, j),bcopy(i, j)]
    if(a(i,j) ~= bcopy(i, j))&&(mod(bcopy(i, j),2)==0)
        res(i, j) = 1;
    elseif(a(i,j) ~= bcopy(i, j))&&(mod(bcopy(i, j),2)==1)
        res(i, j) = 0;
    elseif(a(i, j) == bcopy(i, j))&&(mod(bcopy(i, j),2)==1)
        res(i,j) = 1;
    elseif(a(i,j) == bcopy(i, j))&&(mod(bcopy(i, j),2)==0)
        res(i, j) = 0;

    end
 end    
end


res;

for i = 1 : stl
    c(i)=res(ra,ca-i+1);
end

c = num2str(c);
c = c(find(~isspace(c)));
kot = reshape(c, [], 8);                            % Reshape To (12x8) Character Array
[rbin,cbin] = size(kot);


x = zeros(rbin,1);
y=0;
for i = 1:rbin
   for j = 1 : cbin
       u=j-1;
       x(i) = x(i) + kot(i,j) * 2.^(u);
       
   end
   y=y+1;
end

x;

qwe = (num2str(kot));
qw  = bin2dec(qwe);
char(qw')






ty = 0;

for i=1:ra
    for j=1:ca   
        if(a(i,j) ~= bcopy(i,j))
            ty = ty+1;
            %disp('dziala3');
            
        end
    end
end

if (c-'0' == sst)
    disp('dziala2');
else
    disp('nie dziala2');
end











