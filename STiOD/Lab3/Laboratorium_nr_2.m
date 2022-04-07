clc
close all;
clear all;
a = imread('cienkopisy_srgb.png');
[ra,ca] = size(a);
b = imread('cienkopisy_srgb_CFA.png');
figure,imshow(b);
[rb,cb] = size(b);
bcopy = b;
rbc = rb;
st = 'Rafal_Fieroch_Marcin_Obyrtal';
sst = dec2bin(st,8);
dr = bin2dec(sst)
chr = convertStringsToChars(sst)
sst = sst(:);
sst = sst';
%sst = flip(sst);

k=0;
stl = length(sst);
for i = 1 : stl
    if (i > rb)
        rbc = rbc-1;
        k=k+1;

    end
    
        if (mod(b(rbc,cb-i+1-rb*k),2) == 1) && (sst(i) == 0)
           b(rbc,cb-i+1-rb*k) = b(rbc,cb-i+1-rb*k) - 1; 
        end
        if  (mod(b(rbc,cb-i+1-rb*k),2) == 0) && (sst(i) == 1)
            b(rbc,cb-i+1-rb*k) = b(rb,cb-i+1) + 1;   
        end
   

end

k=0;
stl = length(sst);
for i = 1 : stl
    if (i > rb)
        rbc = rbc-1;
        k=k+1;

    end
    
        if (mod(b(rbc,cb-i+1-rb*k),2) == 1) && (sst(i) == 0)
           b(rbc,cb-i+1-rb*k) = b(rbc,cb-i+1-rb*k) - 1; 
        end
        if  (mod(b(rbc,cb-i+1-rb*k),2) == 0) && (sst(i) == 1)
            b(rbc,cb-i+1-rb*k) = b(rb,cb-i+1) + 1;   
        end
   

end
figure,imshow(b);


rbc = rb;

res = zeros(rb, cb);
g = zeros(stl);
for j = 1 : cb
 for i = 1 : rb
%     if (i > rb)
%         rbc = rbc-1;
%         k=k+1;

%     end
    %g(i, j) = [b(i, j),bcopy(i, j)]
    if(b(i, j) == bcopy(i, j))&&(mod(b(i, j),2)==1)
        res(i,j) = 1;
    elseif(b(i,j) == bcopy(i, j))&&(mod(b(i, j),2)==0)
        res(i, j) = 0;
    elseif(b(i) ~= bcopy(i, j))&&(mod(b(i, j),2)==0)
        res(i, j) = 1;
    elseif(b(i) ~= bcopy(i, j))&&(mod(b(i, j),2)==1)
        res(i, j) = 0;
    end
 end    
end

res;

for i = 1 : stl


    c(i)=res(1,i);
    
end

%c = flip(c);
%c =ones(1,stl);
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







for i=1:rb
    for j=1:cb   
        if(b(i,j) ~= bcopy(i,j))
            %disp('dziala3');
            
        end
    end
end

if (c == sst)
    disp('dziala2');
else
    disp('nie dziala2');
end
 
x










