function [A,B] = generuj()
size = 4;
A=zeros(size);
B=zeros(size); 
    for i=1:size
        for j=1:size
            A(i,j)=randi([-50 50],1);
            B(i,j)=randi([-50 50],1);
        end
    end
end