function line(A)
    [r, c] = size(A);
    disp('Gracz 1:')
    X=linprog(-[1;zeros(r,1)],[ones(c,1) -A'],zeros(c,1),[0 ones(1,r)],[1],[-inf;zeros(r,1)]);
    v=X(1,1);
    X(1,:)=[]
    disp ('Gracz 2:')
    Y=linprog([1;zeros(c,1)],[-ones(r,1) A],zeros(r,1),[0 ones(1,c)],[1],[-inf;zeros(c,1)]);
    Y(1,:)=[]
    disp (['Punkt siod³owy: ', num2str(v)]);
end