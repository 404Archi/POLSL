function [gracz1, maks, gracz2, mini] = Lab1(A)
maksy = max(A');
miny = min(A);
maks = min(maksy); %poziom bezpieczeństwa dla minimalizującego
mini = max(miny); %poziom bezpieczeństwa dla maksymalizującego
for i = 1 : length(maksy)
    if(maksy(i)== maks)
        mini
%         disp('gracz pierwszy(minimalizuje) gra: ');
%         disp(i);
        gracz1 = i;
    end
end
for i = 1 : length(miny)
    if(miny(i)== mini)
%         disp('gracz drugi(maksymalizuje) gra: ');
%         disp(i);
        gracz2 = i;
    end
end
if(maks == mini)
    disp('istnieje punkt siodłowy');
end
end