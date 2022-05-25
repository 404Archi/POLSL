function [punkt_siodlowy, decyzjaD1, decyzjaD2] = siodlowy(A, rola)
[Nx,Ny]=size(A);
%'maxmin'; %pierwszy maksymalizuje, drugi minimalizuje
%'minmax'; %pierwszy minimalizuje, drugi maksymalizuje
%--------------------------------------------------
if rola=='maxmin'
    A=A';
    [Nx,Ny]=size(A);
end
%gracz pierwszy
for i=1:Nx
    Tab_max(i)=max(A(i,:));
end
[S_D1, decyzjaD1]=min(Tab_max);
%gracz drugi
for j=1:Ny
    Tab_min(j)=min(A(:,j));
end
[S_D2, decyzjaD2]=max(Tab_min);
if S_D1==S_D2
    punkt_siodlowy=S_D1;
    disp(['Wybory graczy D1=', num2str(decyzjaD1), '; D2=' num2str(decyzjaD2)]);
    disp(['Punkt siodlowy istnieje. Poziom bezpieczeństwa graczy to: ' num2str(S_D2)]);
end
if S_D1~=S_D2
    disp('Punkt siodlowy nie istnieje.');
end
