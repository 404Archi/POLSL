function graf(A)
    y = (0:0.001:1);
    disp('Gracz 1:');
    figure;
    %wykres dla gracza pierwszego
    plot(y, A(2,1)*y+A(1,1)*(1-y), y, A(2,2)*y+A(1,2)*(1-y)); grid on;
    %warto�� y10
    x = funkcja(A);
    x2 = 1-x;
    disp(['Rozwi�zanie to: S1 = ' num2str(x) ' oraz S2 = ' num2str(x2)]);
    disp('Gracz 2:');
    A = A';
    figure;
    %wykres dla gracza drugiego
    plot(y, A(2,1)*y+A(1,1)*(1-y), y, A(2,2)*y+A(1,2)*(1-y)); grid on;
    %warto�� z10
    y = funkcja(A);
    y2=1-y;
    disp(['Rozwi�zanie to: S1 = ' num2str(y) ' oraz S2 = ' num2str(y2)]);
    A=A';
    ps=A(1,2)*x*y+A(1,1)*x*y2+A(2,2)*x2*y+A(2,1)*x2*y2;
    disp(['Punkt siodlowy to: ' num2str(ps)]);
end