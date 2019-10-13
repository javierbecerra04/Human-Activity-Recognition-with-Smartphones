function  generarboxplots(train)
    caracte = table2array(train(:,1:561));
    V = var(caracte);
    [B,I] = maxk(V,8);
    [~,~,id] = unique(train(:,563));
    clases = table2array(unique(train(:,563)))
    actividad1 = table2array(train(find(id==1),I));
    actividad2 = table2array(train(find(id==2),I));
    actividad3 = table2array(train(find(id==3),I));
    actividad4 = table2array(train(find(id==4),I));
    actividad5 = table2array(train(find(id==5),I));
    actividad6 = table2array(train(find(id==6),I));
    boxplot([actividad1(1:986,1) actividad2(1:986,1) actividad3(1:986,1) actividad4(1:986,1) actividad5(1:986,1) actividad6(1:986,1)],clases)
    title('Frecuencia Aceleración Cuerpo Jerk Entropía en X')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,2) actividad2(1:986,2) actividad3(1:986,2) actividad4(1:986,2) actividad5(1:986,2) actividad6(1:986,2)],clases)
    title('Frecuencia Aceleración Cuerpo Jerk Entropía en Y')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,3) actividad2(1:986,3) actividad3(1:986,3) actividad4(1:986,3) actividad5(1:986,3) actividad6(1:986,3)],clases)
    title('Tiempo Aceleración Cuerpo Jerk Magnitud Entropía')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,4) actividad2(1:986,4) actividad3(1:986,4) actividad4(1:986,4) actividad5(1:986,4) actividad6(1:986,4)],clases)
    title('Frecuencia Aceleración Cuerpo Entropía en X')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,5) actividad2(1:986,5) actividad3(1:986,5) actividad4(1:986,5) actividad5(1:986,5) actividad6(1:986,5)],clases)
    title('Tiempo Aceleración Gravedad Correlación XZ')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,6) actividad2(1:986,6) actividad3(1:986,6) actividad4(1:986,6) actividad5(1:986,6) actividad6(1:986,6)],clases)
    title('Tiempo Aceleración Gravedad Correlación YZ')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,7) actividad2(1:986,7) actividad3(1:986,7) actividad4(1:986,7) actividad5(1:986,7) actividad6(1:986,7)],clases)
    title('Tiempo Giroscopio Cuerpo Jerk Magnitud de Entropía')
    xlabel('Actividad')
    ylabel('Valor')
    figure
    boxplot([actividad1(1:986,8) actividad2(1:986,8) actividad3(1:986,8) actividad4(1:986,8) actividad5(1:986,8) actividad6(1:986,8)],clases)
    title('Tiempo Aceleración Gravedad Energía en X')
    xlabel('Actividad')
    ylabel('Valor')
end