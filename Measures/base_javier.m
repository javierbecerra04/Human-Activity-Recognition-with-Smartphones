%% Importar datos acelerometro Javier muñeca

%Actividad 1: Acostado 2: Sentado 3: En pie 4:Caminando 5:Bajandoescaleras
%6: subiendo escaleras

Accelerometer_acostado1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_acostado1\Accelerometer.csv',1);
Accelerometer_Javier = Accelerometer_acostado1(find(abs(Accelerometer_acostado1(:,1))<14000),2:5);
Accelerometer_acostado2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_acostado2\Accelerometer.csv',1);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_acostado2(find(abs(Accelerometer_acostado2(:,1))<14000),2:5)];
Accelerometer_sentado1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_sentado1\Accelerometer.csv',2);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_sentado1(find(abs(Accelerometer_sentado1(:,1))<14000),2:5)];
Accelerometer_sentado2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_sentado2\Accelerometer.csv',2);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_sentado2(find(abs(Accelerometer_sentado2(:,1))<14000),2:5)];
Accelerometer_enpie1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_enpie1\Accelerometer.csv',3);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_enpie1(find(abs(Accelerometer_enpie1(:,1))<14000),2:5)];
Accelerometer_enpie2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_enpie2\Accelerometer.csv',3);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_enpie2(find(abs(Accelerometer_enpie2(:,1))<14000),2:5)];
Accelerometer_caminar1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_caminar1\Accelerometer.csv',4);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_caminar1(find(abs(Accelerometer_caminar1(:,1))<14000),2:5)];
Accelerometer_caminar2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_caminar2\Accelerometer.csv',4);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_caminar2(find(abs(Accelerometer_caminar2(:,1))<14000),2:5)];
Accelerometer_bajarescaleras1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_bajarescaleras1\Accelerometer.csv',5);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_bajarescaleras1(find(abs(Accelerometer_bajarescaleras1(:,1))<14000),2:5)];
Accelerometer_bajarescaleras2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_bajarescaleras2\Accelerometer.csv',5);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_bajarescaleras2(find(abs(Accelerometer_bajarescaleras2(:,1))<14000),2:5)];
Accelerometer_subirescaleras1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_subirescaleras1\Accelerometer.csv',6);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_subirescaleras1(find(abs(Accelerometer_subirescaleras1(:,1))<14000),2:5)];
Accelerometer_subirescaleras2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_subirescaleras2\Accelerometer.csv',6);
Accelerometer_Javier = [Accelerometer_Javier;Accelerometer_subirescaleras2(find(abs(Accelerometer_subirescaleras2(:,1))<14000),2:5)];


%% Importar giroscopio muñeca Javier muñeca

Gyroscope_acostado1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_acostado1\Gyroscope.csv',1);
Gyroscope_Javier = Gyroscope_acostado1(find(abs(Gyroscope_acostado1(:,1))<14000),2:5);
Gyroscope_acostado2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_acostado2\Gyroscope.csv',1);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_acostado2(find(abs(Gyroscope_acostado2(:,1))<14000),2:5)];
Gyroscope_sentado1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_sentado1\Gyroscope.csv',2);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_sentado1(find(abs(Gyroscope_sentado1(:,1))<14000),2:5)];
Gyroscope_sentado2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_sentado2\Gyroscope.csv',2);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_sentado2(find(abs(Gyroscope_sentado2(:,1))<14000),2:5)];
Gyroscope_enpie1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_enpie1\Gyroscope.csv',3);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_enpie1(find(abs(Gyroscope_enpie1(:,1))<14000),2:5)];
Gyroscope_enpie2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_enpie2\Gyroscope.csv',3);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_enpie2(find(abs(Gyroscope_enpie2(:,1))<14000),2:5)];
Gyroscope_caminar1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_caminar1\Gyroscope.csv',4);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_caminar1(find(abs(Gyroscope_caminar1(:,1))<14000),2:5)];
Gyroscope_caminar2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_caminar2\Gyroscope.csv',4);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_caminar2(find(abs(Gyroscope_caminar2(:,1))<14000),2:5)];
Gyroscope_bajarescaleras1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_bajarescaleras1\Gyroscope.csv',5);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_bajarescaleras1(find(abs(Gyroscope_bajarescaleras1(:,1))<14000),2:5)];
Gyroscope_bajarescaleras2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_bajarescaleras2\Gyroscope.csv',5);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_bajarescaleras2(find(abs(Gyroscope_bajarescaleras2(:,1))<14000),2:5)];
Gyroscope_subirescaleras1 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_subirescaleras1\Gyroscope.csv',6);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_subirescaleras1(find(abs(Gyroscope_subirescaleras1(:,1))<14000),2:5)];
Gyroscope_subirescaleras2 = importdatos('C:\Users\TG1808\OneDrive\TESIS\Mediciones\Javier Becerra\Muñeca\Javier_Becerra_subirescaleras2\Gyroscope.csv',6);
Gyroscope_Javier = [Gyroscope_Javier;Gyroscope_subirescaleras2(find(abs(Gyroscope_subirescaleras2(:,1))<14000),2:5)];