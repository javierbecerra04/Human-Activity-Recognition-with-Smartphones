function corr = correlacion(signal1,signal2)
    correl = corrcoef(signal1,signal2);
    corr = correl(1,2)
end