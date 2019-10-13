function arcoef = arcoeficiente(signal1,num)
    modelo = ar(signal1,3);
    A = polydata(modelo);
    arcoef = A(num);
end