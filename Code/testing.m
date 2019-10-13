function exactitud = testing(modelpred,etiquetas)
    cont = 0;
    len = 2947;
    for i = 1:2947
        if modelpred(i) == etiquetas(i)
            cont= cont+1;
        end
    end
    exactitud = (cont/length(etiquetas))*100;
end
