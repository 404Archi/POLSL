function rozw = funkcja(A)
    syms y;
    f=A(1,1)*y+A(2,1)*(1-y)-(A(1,2)*y+A(2,2)*(1-y));
    rozw = solve(f,y);
    rozw = double(rozw);
end