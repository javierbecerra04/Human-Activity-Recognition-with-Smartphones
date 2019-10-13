%% Leer base de datos

participant_one = csvread('C:\Users\TG1808\OneDrive\TESIS\Extraccion de caracteristicas\Activity Recognition from Single Chest-Mounted Accelerometer\1.csv')
accelerometer_x = participant_one(:,2);
accelerometer_y = participant_one(:,3);
accelerometer_z = participant_one(:,4);

%% Guardar variables


%% Filtrado

sampling_freq = 52;
unit_time = 1/sampling_freq;

%Filtro mediano de tercer orden
x_filtrado = medfilt1(accelerometer_x);
y_filtrado = medfilt1(accelerometer_y);
z_filtrado = medfilt1(accelerometer_z);

time_vector = unit_time*participant_one(:,1);
num_unidades = round(6/(1/52));

plot(time_vector(1:num_unidades),accelerometer_x(1:num_unidades))
xlabel('Tiempo (s)')
ylabel('Voltaje (mV)')
% title('Señal no filtrada')
% hold on
% plot(time_vector(1:num_unidades),x_filtrado(1:num_unidades));

%Filtro pasabajos de 20Hz
x_filtrado = filtfilt(filtropasabajas20,G,x_filtrado);
y_filtrado = filtfilt(filtropasabajas20,G,y_filtrado);
z_filtrado = filtfilt(filtropasabajas20,G,z_filtrado);

%subplot(2,2,[3,4]);
hold on
plot(time_vector(1:num_unidades),x_filtrado(1:num_unidades));
legend('Señal no filtrada','Señal filtrada')
title('Señal con filtro pasabajos y mediano')

% figure

%Filtro pasabajos para gravedad 0.3
x_gravedad = filtfilt(pasabajas,G1,x_filtrado);
y_gravedad = filtfilt(pasabajas,G1,y_filtrado);
z_gravedad = filtfilt(pasabajas,G1,z_filtrado);

%Filtro pasaaltos para el cuerpo
x_cuerpo = filtfilt(pasaaltas,G2,x_filtrado);
y_cuerpo = filtfilt(pasaaltas,G2,y_filtrado);
z_cuerpo = filtfilt(pasaaltas,G2,z_filtrado);

figure;
plot(time_vector(1:num_unidades),x_gravedad(1:num_unidades));
title('Separación de señales')
xlabel('Tiempo (s)')
ylabel('Voltaje (mV)')
hold on
% title('Señal Gravedad')
% 
% subplot(2,2,2);
plot(time_vector(1:num_unidades),x_cuerpo(1:num_unidades));
% title('Señal Cuerpo')
hold on
% subplot(2,2,[3,4]);
plot(time_vector(1:num_unidades),x_filtrado(1:num_unidades));
legend('Señal de gravedad','Señal de Cuerpo','Señal Filtrada')
% title('Señal no separada')
%% Ventaneo
%Ventanas
cont = 2.56/unit_time;
cont_aux2 = round(cont);
cont_aux = 1;
num_ventanas = 2*((length(accelerometer_x))/cont);
num_ventanas = floor(num_ventanas);
for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(x_cuerpo))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finalx(:,j)=x_cuerpo(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finalx(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end
for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(x_cuerpo))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finaly(:,j)=y_cuerpo(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finaly(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end
for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(x_cuerpo))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finalz(:,j)=z_cuerpo(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finalz(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end
for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(x_gravedad))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finalgx(:,j)=x_gravedad(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finalgx(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end

for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(y_gravedad))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finalgy(:,j)=y_gravedad(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finalgy(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end

for j=1:num_ventanas
    if ((round(cont_aux2*((j-1)/2))+1+cont_aux2)>length(z_gravedad))
        break;
    end
    if (participant_one(round(cont_aux2*((j-1)/2))+1,5)==(participant_one(round(cont_aux2*((j-1)/2))+cont_aux2+1,5)))
        vector_finalgz(:,j)=z_gravedad(round(cont_aux2*((j-1)/2))+1:round(cont_aux2*((j-1)/2))+cont_aux2+1);
        vector_finalgz(cont_aux2+1,j) = participant_one(round(cont_aux2*((j-1)/2))+cont_aux2,5);
    end
end
%% Caracteristicas

for i=1:length(vector_finalx(1,:))
    
    base_train(i,1) = vector_finalx(134,i);
    base_train(i,2) = mean(vector_finalx(1:133,i)); %hay que hacerlo para x,y,z
    base_train(i,3) = var(vector_finalx(1:133,i));
    base_train(i,4) = mad(vector_finalx(1:133,i));
    base_train(i,5) = rms(vector_finalx(1:133,i));
    base_train(i,6) = ZCR(vector_finalx(1:133,i));
    base_train(i,7) = iqr(vector_finalx(1:133,i));
    base_train(i,8) = prctile(vector_finalx(1:133,i),75);
    base_train(i,9) = kurtosis(vector_finalx(1:133,i));
    base_train(i,10) = min(vector_finalx(1:133,i));
    base_train(i,11) = max(vector_finalx(1:133,i));
    base_train(i,12) = SE(vector_finalx(1:133,i));
    base_train(i,13) = entr(vector_finalx(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,14) = entr(vector_finalx(1:133,i)); %Espectro de entropia 
    
    base_train(i,15) = mean(vector_finaly(1:133,i));
    base_train(i,16) = var(vector_finaly(1:133,i));
    base_train(i,17) = mad(vector_finaly(1:133,i));
    base_train(i,18) = rms(vector_finaly(1:133,i));
    base_train(i,19) = ZCR(vector_finaly(1:133,i));
    base_train(i,20) = iqr(vector_finaly(1:133,i));
    base_train(i,21) = prctile(vector_finaly(1:133,i),75);
    base_train(i,22) = kurtosis(vector_finaly(1:133,i));
    base_train(i,23) = min(vector_finaly(1:133,i));
    base_train(i,24) = max(vector_finaly(1:133,i));
    base_train(i,25) = SE(vector_finaly(1:133,i));
    base_train(i,26) = entr(vector_finaly(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,27) = entr(vector_finaly(1:133,i)); %Espectro de entropia
    
    base_train(i,28) = mean(vector_finalz(1:133,i));
    base_train(i,29) = var(vector_finalz(1:133,i));
    base_train(i,30) = mad(vector_finalz(1:133,i));
    base_train(i,31) = rms(vector_finalz(1:133,i));
    base_train(i,32) = ZCR(vector_finalz(1:133,i));
    base_train(i,33) = iqr(vector_finalz(1:133,i));
    base_train(i,34) = prctile(vector_finalz(1:133,i),75);
    base_train(i,35) = kurtosis(vector_finalz(1:133,i));
    base_train(i,36) = min(vector_finalz(1:133,i));
    base_train(i,37) = max(vector_finalz(1:133,i));
    base_train(i,38) = SE(vector_finalz(1:133,i));
    base_train(i,39) = entr(vector_finalz(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,40) = entr(vector_finalz(1:133,i)); %Espectro de entropia
    
    base_train(i,41) = mean(vector_finalgx(1:133,i));
    base_train(i,42) = var(vector_finalgx(1:133,i));
    base_train(i,43) = mad(vector_finalgx(1:133,i));
    base_train(i,44) = rms(vector_finalgx(1:133,i));
    base_train(i,45) = ZCR(vector_finalgx(1:133,i));
    base_train(i,46) = iqr(vector_finalgx(1:133,i));
    base_train(i,47) = prctile(vector_finalgx(1:133,i),75);
    base_train(i,48) = kurtosis(vector_finalgx(1:133,i));
    base_train(i,49) = min(vector_finalgx(1:133,i));
    base_train(i,50) = max(vector_finalgx(1:133,i));
    base_train(i,51) = SE(vector_finalgx(1:133,i));
    base_train(i,52) = entr(vector_finalgx(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,53) = entr(vector_finalgx(1:133,i)); %Espectro de entropia
   
    base_train(i,54) = mean(vector_finalgy(1:133,i));
    base_train(i,55) = var(vector_finalgy(1:133,i));
    base_train(i,56) = mad(vector_finalgy(1:133,i));
    base_train(i,57) = rms(vector_finalgy(1:133,i));
    base_train(i,58) = ZCR(vector_finalgy(1:133,i));
    base_train(i,59) = iqr(vector_finalgy(1:133,i));
    base_train(i,60) = prctile(vector_finalgy(1:133,i),75);
    base_train(i,61) = kurtosis(vector_finalgy(1:133,i));
    base_train(i,62) = min(vector_finalgy(1:133,i));
    base_train(i,63) = max(vector_finalgy(1:133,i));
    base_train(i,64) = SE(vector_finalgy(1:133,i));
    base_train(i,65) = entr(vector_finalgy(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,66) = entr(vector_finalgy(1:133,i)); %Espectro de entropia
    
    base_train(i,67) = mean(vector_finalgz(1:133,i));
    base_train(i,68) = var(vector_finalgz(1:133,i));
    base_train(i,69) = mad(vector_finalgz(1:133,i));
    base_train(i,70) = rms(vector_finalgz(1:133,i));
    base_train(i,71) = ZCR(vector_finalgz(1:133,i));
    base_train(i,72) = iqr(vector_finalgz(1:133,i));
    base_train(i,73) = prctile(vector_finalgz(1:133,i),75);
    base_train(i,74) = kurtosis(vector_finalgz(1:133,i));
    base_train(i,75) = min(vector_finalgz(1:133,i));
    base_train(i,76) = max(vector_finalgz(1:133,i));
    base_train(i,77) = SE(vector_finalgz(1:133,i));
    base_train(i,78) = entr(vector_finalgz(1:133,i));
    %base_train(i,13) = pentropy(vector_finalx(1:133,i));
    base_train(i,79) = entr(vector_finalgz(1:133,i)); %Espectro de entropia
end

%%
testtt=csvread('C:\Users\TG1808\OneDrive\TESIS\Extraccion de caracteristicas\Activity Recognition from Single Chest-Mounted Accelerometer\2.csv');
yfit = trainedModel1.predictFcn(testtt)