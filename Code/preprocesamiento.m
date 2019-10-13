%% Leer base de datos

participant_one = csvread('C:\Users\TG1808\OneDrive\TESIS\Extraccion de caracteristicas\Activity Recognition from Single Chest-Mounted Accelerometer\1.csv')
accelerometer_x = participant_one(:,2);
accelerometer_y = participant_one(:,3);
accelerometer_z = participant_one(:,4);

%% Guardar variables


%% Extraccion de caracteristicas

sampling_freq = 52;
unit_time = 1/sampling_freq;

%Filtro mediano de tercer orden
x_filtrado = medfilt1(accelerometer_x);
y_filtrado = medfilt1(accelerometer_y);
z_filtrado = medfilt1(accelerometer_z);

%Filtro pasabajos de 20Hz
fs = 1e3;
%lowpass(x_filtrado,20,fs)
t = 0:1/fs:1;

x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;
y = lowpass(x,150,fs)