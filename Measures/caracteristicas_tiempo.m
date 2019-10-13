function final_database = caracteristicas_tiempo(signal_form,participant_one,final_database)
    sampling_freq = 100;
    unit_time = 1/sampling_freq;
    cont = 2.56/unit_time;
    cont_aux2 = round(cont);
    num_ventanas = 2*((length(signal_form(:,1)))/cont);
    num_ventanas = floor(num_ventanas);
    i = length(final_database(:,:));
    cont = 0;
    final_database_aux = zeros(num_ventanas, 41);
    for j=1:num_ventanas
        if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(signal_form(:,1)))
            break;
        elseif (participant_one(round(cont_aux2*((j-1)/2))+1,4)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,4)))
            cont = cont + 1;
            final_database_aux(cont,1) = mean(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,2) = mean(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,3) = mean(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,4) = std(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,5) = std(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,6) = std(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,7) = mad(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,8) = mad(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,9) = mad(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,10) = max(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,11) = max(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,12) = max(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,13) = min(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,14) = min(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,15) = min(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,16) = sma_tesis(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,17) = calc_energy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,18) = calc_energy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,19) = calc_energy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,20) = iqr(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,21) = iqr(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,22) = iqr(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,23) = entropy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1));
            final_database_aux(cont,24) = entropy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,25) = entropy(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,26) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),1);            
            final_database_aux(cont,27) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),2);
            final_database_aux(cont,28) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),3);
            final_database_aux(cont,29) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),4);
            final_database_aux(cont,30) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),1);            
            final_database_aux(cont,31) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),2);
            final_database_aux(cont,32) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),3);
            final_database_aux(cont,33) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),4);
            final_database_aux(cont,34) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3),1);            
            final_database_aux(cont,35) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3),2);
            final_database_aux(cont,36) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3),3);
            final_database_aux(cont,37) = arcoeficiente(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3),4);
            final_database_aux(cont,38) = correlacion(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2));
            final_database_aux(cont,39) = correlacion(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,1),signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,40) = correlacion(signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,2),signal_form(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1,3));
            final_database_aux(cont,41) = (participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,4));
        end
    end
    if isempty(final_database)
        final_database = [final_database_aux];
    else
        final_database = [final_database(:,1:length(final_database(1,:))-1),final_database_aux(1:length(final_database(:,1)),:)];
    end
end