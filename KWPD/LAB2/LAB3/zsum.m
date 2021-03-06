function [C,D,msg]=zsum(A)
r=[];s=[];
[m,n]=size(A);
if min(max(A))==max(min(A'))
    b=max(A);C=[];D=[];ms=[];
    for i=1:n
        for j=1:m
            if isequal(b(i),A(j,i))
                if isequal(A(j,i),min(A(j,:)))
                    r(length(r)+1)=j;
                    s(length(s)+1)=i;
                end
            end
        end
    end
    if (length(r)==1 && length (s)==1)
        msg=['The Game has a saddle point at the location :- (' int2str(r) ',' int2str(s) ') and value of the game is ' num2str(A(r,s),6) '. So no mixed strategy is needed.'];
    else    
        for i=1:length(r)
            ms=[ms '(' int2str(r(i)) ',' int2str(s(i)) '),'];
        end
        msg=['The Game has saddle points at the locations :-' ms ' and value of the game is ' num2str(A(r(1),s(1)),6) '. So no mixed strategy is needed.'];
    end
else
    X_a=linprog(-[1;zeros(m,1)],[ones(n,1) -A'],zeros(n,1),[0 ones(1,m)],[1],[-inf;zeros(m,1)]);v=X_a(1,1);X_a(1,:)=[];
    X_b=linprog([1;zeros(n,1)],[-ones(m,1) A],zeros(m,1),[0 ones(1,n)],[1],[-inf;zeros(n,1)]);X_b(1,:)=[];
    C=roundn(X_a,-6);
    D=roundn(X_b,-6);
    msg=['The Game has no saddle point and value of the game is ' num2str(v,6) ' and therefore the suggested mixed strategy is given in mixed strategy matrix.'];
end