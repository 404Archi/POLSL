
function nash(A,B)
    [Nx,Ny] = size(A);
    wybory_A=zeros(Ny);
    wybory_B=zeros(Ny);
    row_nasha=zeros(4,Ny);
    %wybory gracza A
    for j=1:Ny
            [minimum,index]=min(A(:,j));
            wybory_A(1,j)=index;
            wybory_A(2,j)=j;
            wybory_A(3,j)=minimum;
    end
    %wybory gracza B
    for i=1:Nx
            [minimum,index]=min(B(i,:));
            wybory_B(1,i)=i;
            wybory_B(2,i)=index;
            wybory_B(3,i)=minimum;
    end
    %szukanie rownowagi Nasha
    k=1;
    for j=1:Ny
       if wybory_A(1,j) == wybory_B(1,j)
           if wybory_A(2,j) == wybory_B(2,j)
                row_nasha(1,k)=wybory_A(1,j);
                row_nasha(2,k)=wybory_A(2,j);
                row_nasha(3,k)=wybory_A(3,j);
                row_nasha(4,k)=wybory_B(3,j);
                k=k+1;
           end
       end
    end
    %wyswietlanie wyników
    for i=1:k-1
        disp(['Row. Nasha ' num2str(i) ': (' num2str(row_nasha(1,i)) ',' num2str(row_nasha(2,i)) ')=(' num2str(row_nasha(3,i)) ',' num2str(row_nasha(4,i))  ')']);
    end

    %szukanie dopuszczalnej
    Suma = sum(row_nasha(3:4,:));
    minimum=min(Suma);
    for j=1:Ny
        if Suma(j)==minimum
            disp(['Dopuszczalne: (' num2str(row_nasha(1,j)) ',' num2str(row_nasha(2,j)) ')=(' num2str(row_nasha(3,j)) ',' num2str(row_nasha(4,j))  ')']);
        end
    end

    %rownowaga minimaksowa
    k=1;
    for i=1:Nx
        [maksimum,j]=max(A(i,:));
        [minimum,index] = min(A(:,j));
        if maksimum <= minimum
            minmaks1(1,k)=index;
            minmaks1(2,k)=j;
            minmaks1(3,k)=A(index,j);
            k=k+1;
        end
    end
    if k==1
        disp('Brak minimaksowych rozwiazan w macierzy A');
    else
        k=1;
        for j=1:Ny
            [maksimum,i]=max(B(:,j));
            [minimum,index] = min(B(i,:));
            if maksimum <= minimum
                minmaks2(1,k)=index;
                minmaks2(2,k)=j;
                minmaks2(3,k)=B(index,j);
                k=k+1;
            end
        end
    end
    if k==1
            disp('Brak minimaksowych rozwiazan w macierzy B');
    else
            minmaks1
            minmaks2
            for i=1:k-1;
                if minmaks1(1,i)==minmaks2(1,i) && minmaks1(2,i)==minmaks2(2,i)
                    znalezione=1;
                    disp(['Rozwiazanie minimaksowe: (' num2str(minmaks2(1,i)) ',' num2str(minmaks2(2,i)) ')=(' num2str(minmaks1(3,i)) ',' num2str(minmaks2(3,i))  ')']);
                end
            end
    end
end

