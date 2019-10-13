function matriz_axis = caracteristicas(signal_form,participant_one,final_database)
    sampling_freq = 100;
    unit_time = 1/sampling_freq;
    cont = 2.56/unit_time;
    cont_aux2 = round(cont);
    num_ventanas = 2*((length(signal_form))/cont);
    num_ventanas = floor(num_ventanas);
    j = length(final_database(:,:))+1;
    if isempty(final_database)
        final_database
    else
        
    end
end