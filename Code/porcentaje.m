function Matriz = porcentaje(C1)

for i=1:length(C1(1,:))
    suma = sum(C1(i,:));
    for j=1:length(C1(1,:))
        C1(i,j)=round(((C1(i,j)/suma)*100),1);
    end
end
Matriz = C1;
end