a = uint8(imread('TestImage2.png'));
b = uint8(imread('authors.png'));

for x=1:size(b,1)
    for y=1:size(b,2)
        for z=1:size(b,3)
            inp = b(x,y,z);
            outp = a(x,y,z);
            % jezeli wartosc piksela inp jest wieksza niz 127 ustawiamy LSB
            % pikselu outp na 1
            outp = bitset(outp,1, inp>127);
            a(x,y,z) = outp;
        end
    end
end

figure, imshow(a); % pokazanie rysunku zakodowanego

c=uint8(zeros(size(a,1),size(a,2),size(a,3)));
for x=1:size(c,1)
    for y=1:size(c,2)
        for z=1:size(c,3)
            inp = a(x,y,z);
            outp = 0;
            outp(bitand(inp,1) == 1) = 255; %j ezeli wartość LSB piksela 
            % obrazu zawierajacego ukryty obraz wynosi 1 zmien wartosc na 255
            c(x,y,z) = outp;
        end
    end
end

figure, imshow(c); % pokazanie rysunku odkodowanego