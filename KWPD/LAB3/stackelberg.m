function stackelberg(A,B,rola_A)
    %rola_A: leader albo follower
    [Nx,Ny] = size(A);
    if strcmp(rola_A,'follower') == 1
        temp_A=A;
        A=B;
        B=temp_A;
        A=A';
        B=B';
    end
    k=1;
    for i=1:Nx
        minimum=min(B(i,:));
        for j=1:Ny
            if B(i,j)==minimum
               tf(1,k)=i;
               tf(2,k)=j;
               tf(3,k)=A(i,j);
               k=k+1;
            end
        end
    end
    k=1;
    m=1;
    lw=0;
    plw=1;
    for i=1:Nx
        while k <= size(tf,2) && i == tf(1,k) 
            lw=lw+1;
            k=k+1;
        end
        maksimum_wiersz = max(tf(3,plw:plw+lw-1));
        for j=plw:plw+lw-1
            if maksimum_wiersz == tf(3,j);
                tf1(1,m)=i;
                tf1(2,m)=tf(2,j);
                tf1(3,m)=maksimum_wiersz;
                m=m+1;
            end
        end
        plw=plw+lw;
        lw=0;
        j=1;
    end
    k=1;
    minimum = min(tf1(3,:));
    for i=1:size(tf1,2)
       if tf1(3,i)==minimum
           tw(1,k)=tf1(1,i);
           tw(2,k)=tf1(2,i);
           tw(3,k)=tf1(3,i);
           tw(4,k)=B(tf1(1,i),tf1(2,i));
           disp(['Row. Stackelberga ' num2str(i) ': (' num2str(tw(1,k)) ',' num2str(tw(2,k)) ')=(' num2str(tw(3,k)) ',' num2str(tw(4,k))  ')']);
           k=k+1;
       end
    end
end
