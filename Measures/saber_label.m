function label = saber_label(str)
    if contains(str,'acostado')
        label=1;
    end
    if contains(str,'sentado')
        label=2;
    end
    if contains(str,'pie')
        label=3;
    end
    if contains(str,'camina')
        label=4;
    end
    if contains(str,'baja')
        label=5;
    end
    if contains(str,'subi')
        label=6;
    end
end