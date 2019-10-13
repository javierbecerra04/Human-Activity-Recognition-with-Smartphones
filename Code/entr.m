function y = entr(x)
%Calcula el valor de la entropia espectral de un vector
    P=sum(abs(fft(x)).^2);
    %Normalization
    d=P(:);
    d=d/sum(d+ 1e-12);

    %Entropy Calculation
    logd = log2(d + 1e-12);
    y = -sum(d.*logd)/log2(length(d));
end