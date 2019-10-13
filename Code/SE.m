function y = SE(x)
%Calcula el valor del espectro de energía de un vector
    transf = fft(x);
    y = sum(abs(transf).^2);
end