function energy = calc_energy(signal)
    energy = sum(abs(signal).^2);
end