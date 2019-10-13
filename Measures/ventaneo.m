function matriz_axis = ventaneo(signal_form,participant_one)
    sampling_freq = 100;
    unit_time = 1/sampling_freq;
    cont = 2.56/unit_time;
    cont_aux2 = round(cont);
    num_ventanas = 2*((length(signal_form))/cont);
    num_ventanas = floor(num_ventanas);
    for j=1:num_ventanas
        if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(signal_form))
            break;
        end
        if (participant_one(round(cont_aux2*((j-1)/2))+1,4)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,4)))
            matriz_axis(:,j)=signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
            matriz_axis(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,4);
        end
    end
end