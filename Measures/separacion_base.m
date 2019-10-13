%EXTRACCIÓN DE LAS CARACTERÍSTICAS BASE DE DATOS FINAL
%%Lectura de Base de datos

%participant_one = csvread('C:\Users\TG1808\OneDrive\TESIS\Extraccion de caracteristicas\Activity Recognition from Single Chest-Mounted Accelerometer\1.csv')
accelerometer_x = Accelerometer(:,1);
accelerometer_y = Accelerometer(:,2);
accelerometer_z = Accelerometer(:,3);
gyroscope_x = Gyroscope(:,1);
gyroscope_y = Gyroscope(:,2);
gyroscope_z = Gyroscope(:,3);

%% Filtrado y separación de los vectores de acelerómetro y giroscopio en el tiempo
tic
sampling_freq = 52;
unit_time = 1/sampling_freq;

%Filtro mediano de tercer orden
x_filtrado = medfilt1(accelerometer_x);
y_filtrado = medfilt1(accelerometer_y);
z_filtrado = medfilt1(accelerometer_z);
plot(x_filtrado(1:100))
x_gyr_filtrado = medfilt1(gyroscope_x);
y_gyr_filtrado = medfilt1(gyroscope_y);
z_gyr_filtrado = medfilt1(gyroscope_z);

%Filtro pasabajos de 20Hz
x_filtrado = doFilter20(x_filtrado);
y_filtrado = doFilter20(x_filtrado);
z_filtrado = doFilter20(x_filtrado);

x_gyr_filtrado = doFilter20(x_gyr_filtrado);
y_gyr_filtrado = doFilter20(x_gyr_filtrado);
z_gyr_filtrado = doFilter20(x_gyr_filtrado);
%%
%Filtro pasabajos para gravedad 0.3
accelerometer_gravedad_x = doFiltergravity(x_filtrado);
accelerometer_gravedad_y = doFiltergravity(y_filtrado);
accelerometer_gravedad_z = doFiltergravity(z_filtrado);
accelerometer_gravedad = [accelerometer_gravedad_x,accelerometer_gravedad_y,accelerometer_gravedad_z];

%Filtro pasaaltos para el cuerpo
accelerometer_cuerpo_x = doFilterBody(x_filtrado);
accelerometer_cuerpo_y = doFilterBody(y_filtrado);
accelerometer_cuerpo_z = doFilterBody(z_filtrado);
accelerometer_cuerpo = [accelerometer_cuerpo_x,accelerometer_cuerpo_y,accelerometer_cuerpo_z];

%Jerk del acelerómetro cuerpo
accelerometer_jerk_cuerpo_x = diff(accelerometer_cuerpo_x);
accelerometer_jerk_cuerpo_y = diff(accelerometer_cuerpo_y);
accelerometer_jerk_cuerpo_z = diff(accelerometer_cuerpo_z);
accelerometer_jerk_cuerpo = [accelerometer_jerk_cuerpo_x,accelerometer_jerk_cuerpo_y,accelerometer_jerk_cuerpo_z];

%Magnitud cuerpo acelerómetro
for i=1:length(accelerometer_cuerpo_x(:,1))
    if i==1
        magnitud_accelerometer_cuerpo = norm([accelerometer_cuerpo_x(i)    accelerometer_cuerpo_y(i)    accelerometer_cuerpo_z(i)]);
    end
    if i>1
        magnitud_accelerometer_cuerpo = [magnitud_accelerometer_cuerpo;norm([accelerometer_cuerpo_x(i)  accelerometer_cuerpo_y(i)   accelerometer_cuerpo_z(i)])];
    end
end

%Magnitud gravedad acelerómetro
for i=1:length(accelerometer_gravedad_x(:,1))
    if i==1
        magnitud_accelerometer_gravedad = norm([accelerometer_gravedad_x(i)    accelerometer_gravedad_y(i)    accelerometer_gravedad_z(i)]);
    end
    if i>1
        magnitud_accelerometer_gravedad = [magnitud_accelerometer_gravedad;norm([accelerometer_gravedad_x(i)  accelerometer_gravedad_y(i)   accelerometer_gravedad_z(i)])];
    end
end

%Magnitud del jerk cuerpo acelerómetro
for i=1:length(accelerometer_jerk_cuerpo_x(:,1))
    if i==1
        magnitud_jerk_accelerometer_cuerpo = norm([accelerometer_jerk_cuerpo_x(i)    accelerometer_jerk_cuerpo_y(i)    accelerometer_jerk_cuerpo_z(i)]);
    end
    if i>1
        magnitud_jerk_accelerometer_cuerpo = [magnitud_jerk_accelerometer_cuerpo;norm([accelerometer_jerk_cuerpo_x(i)  accelerometer_jerk_cuerpo_y(i)   accelerometer_jerk_cuerpo_z(i)])];
    end
end

%Giroscopio cuerpo
Gyroscope_cuerpo_x = doFilterBody(x_gyr_filtrado);
Gyroscope_cuerpo_y = doFilterBody(y_gyr_filtrado);
Gyroscope_cuerpo_z = doFilterBody(z_gyr_filtrado);
Gyroscope_cuerpo = [Gyroscope_cuerpo_x,Gyroscope_cuerpo_y,Gyroscope_cuerpo_z];

%Jerk Giroscopio cuerpo
Gyroscope_jerk_cuerpo_x = diff(Gyroscope_cuerpo_x);
Gyroscope_jerk_cuerpo_y = diff(Gyroscope_cuerpo_y);
Gyroscope_jerk_cuerpo_z = diff(Gyroscope_cuerpo_z);
Gyroscope_jerk_cuerpo = [Gyroscope_jerk_cuerpo_x,Gyroscope_jerk_cuerpo_y,Gyroscope_jerk_cuerpo_z];

%Magnitud giroscopio cuerpo
for i=1:length(Gyroscope_cuerpo_x(:,1))
    if i==1
        magnitud_gyroscope_cuerpo = norm([Gyroscope_cuerpo_x(i)    Gyroscope_cuerpo_y(i)    Gyroscope_cuerpo_z(i)]);
    end
    if i>1
        magnitud_gyroscope_cuerpo = [magnitud_gyroscope_cuerpo;norm([Gyroscope_cuerpo_x(i)  Gyroscope_cuerpo_y(i)   Gyroscope_cuerpo_z(i)])];
    end
end

%Magnitud jerk giroscopio cuerpo
for i=1:length(Gyroscope_jerk_cuerpo_x(:,1))
    if i==1
        magnitud_jerk_gyroscope_cuerpo = norm([Gyroscope_jerk_cuerpo_x(i)    Gyroscope_jerk_cuerpo_y(i)    Gyroscope_jerk_cuerpo_z(i)]);
    end
    if i>1
        magnitud_jerk_gyroscope_cuerpo = [magnitud_jerk_gyroscope_cuerpo;norm([Gyroscope_jerk_cuerpo_x(i)  Gyroscope_jerk_cuerpo_y(i)   Gyroscope_jerk_cuerpo_z(i)])];
    end
end
toc
% características tiempo
tic
%accelerometer_cuerpo
final_database1 = [];
final_database1 = caracteristicas_tiempo(accelerometer_cuerpo,Accelerometer,final_database1);
toc
%
tic
final_database1 = caracteristicas_tiempo(accelerometer_gravedad,Accelerometer,final_database1);
toc
%
tic
final_database1 = caracteristicas_tiempo(accelerometer_jerk_cuerpo,Accelerometer,final_database1);
toc
%
tic
final_database1 = caracteristicas_tiempo(Gyroscope_cuerpo,Gyroscope,final_database1);
toc
%
tic
final_database1 = caracteristicas_tiempo(Gyroscope_jerk_cuerpo,Gyroscope,final_database1);
toc
%
tic
final_database1 = caracteristicas_tiempo(Gyroscope_jerk_cuerpo,Gyroscope,final_database1);
toc
%% Acelerometro en frecuencia
%Acelerómetro cuerpo en frecuencia
freq_accelerometer_cuerpo_x = fft(accelerometer_cuerpo_x);
freq_accelerometer_cuerpo_y = fft(accelerometer_cuerpo_y);
freq_accelerometer_cuerpo_z = fft(accelerometer_cuerpo_z);
freq_accelerometer_cuerpo = [freq_accelerometer_cuerpo_x,freq_accelerometer_cuerpo_y,freq_accelerometer_cuerpo_z];

%Jerk frecuencia cuerpo acelerómetro
freq_jerk_accelerometer_cuerpo_x = diff(freq_accelerometer_cuerpo_x);
freq_jerk_accelerometer_cuerpo_y = diff(freq_accelerometer_cuerpo_y);
freq_jerk_accelerometer_cuerpo_z = diff(freq_accelerometer_cuerpo_z);
freq_jerk_accelerometer_cuerpo = [freq_jerk_accelerometer_cuerpo_x,freq_jerk_accelerometer_cuerpo_y,freq_jerk_accelerometer_cuerpo_z];

%Magnitud cuerpo acelerómetro frecuencia
for i=1:length(freq_accelerometer_cuerpo_x(:,1))
    if i==1
        magnitud_freq_accelerometer_cuerpo = norm([freq_accelerometer_cuerpo_x(i)    freq_accelerometer_cuerpo_y(i)    freq_accelerometer_cuerpo_z(i)]);
    end
    if i>1
        magnitud_freq_accelerometer_cuerpo = [magnitud_freq_accelerometer_cuerpo;norm([freq_accelerometer_cuerpo_x(i)  freq_accelerometer_cuerpo_y(i)   freq_accelerometer_cuerpo_z(i)])];
    end
end

%Magnitud jerk frecuencia cuerpo acelerómetro
for i=1:length(freq_jerk_accelerometer_cuerpo_x(:,1))
    if i==1
        magnitud_freq_jerk_accelerometer_cuerpo = norm([freq_jerk_accelerometer_cuerpo_x(i)    freq_jerk_accelerometer_cuerpo_y(i)    freq_jerk_accelerometer_cuerpo_z(i)]);
    end
    if i>1
        magnitud_freq_jerk_accelerometer_cuerpo = [magnitud_freq_jerk_accelerometer_cuerpo;norm([freq_jerk_accelerometer_cuerpo_x(i)  freq_jerk_accelerometer_cuerpo_y(i)   freq_jerk_accelerometer_cuerpo_z(i)])];
    end
end

%Giroscopio cuerpo en frecuencia
freq_gyroscope_cuerpo_x = fft(Gyroscope_cuerpo_x);
freq_gyroscope_cuerpo_y = fft(Gyroscope_cuerpo_y);
freq_gyroscope_cuerpo_z = fft(Gyroscope_cuerpo_z);
freq_gyroscope_cuerpo = [freq_gyroscope_cuerpo_x,freq_gyroscope_cuerpo_y,freq_gyroscope_cuerpo_z];

%Magnitud frecuencia cuerpo giroscopio
for i=1:length(freq_gyroscope_cuerpo_x(:,1))
    if i==1
        magnitud_freq_gyroscope_cuerpo = norm([freq_gyroscope_cuerpo_x(i)    freq_gyroscope_cuerpo_y(i)    freq_gyroscope_cuerpo_z(i)]);
    end
    if i>1
        magnitud_freq_gyroscope_cuerpo = [magnitud_freq_gyroscope_cuerpo;norm([freq_gyroscope_cuerpo_x(i)  freq_gyroscope_cuerpo_y(i)   freq_gyroscope_cuerpo_z(i)])];
    end
end

%Magnitud jerk giroscopio cuerpo frecuencia
freq_jerk_gyroscope_cuerpo_x = diff(freq_gyroscope_cuerpo_x);
freq_jerk_gyroscope_cuerpo_y = diff(freq_gyroscope_cuerpo_y);
freq_jerk_gyroscope_cuerpo_z = diff(freq_gyroscope_cuerpo_z);

for i=1:length(freq_jerk_gyroscope_cuerpo_x(:,1))
    if i==1
        magnitud_freq_jerk_gyroscope_cuerpo = norm([freq_jerk_gyroscope_cuerpo_x(i)    freq_jerk_gyroscope_cuerpo_y(i)    freq_jerk_gyroscope_cuerpo_z(i)]);
    end
    if i>1
        magnitud_freq_jerk_gyroscope_cuerpo = [magnitud_freq_jerk_gyroscope_cuerpo;norm([freq_jerk_gyroscope_cuerpo_x(i)  freq_jerk_gyroscope_cuerpo_y(i)   freq_jerk_gyroscope_cuerpo_z(i)])];
    end
end

%Angulos en frecuencia
