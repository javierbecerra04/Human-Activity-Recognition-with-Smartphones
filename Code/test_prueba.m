%% Importar datos de Test
test = importfile('test.csv', 2, 2948);

%% Extracción de datos

%Datos De pie
accbmeanx = test.tBodyAccmeanX(1:31);
accbmeany = test.tBodyAccmeanY(1:31);
accbmeanz = test.tBodyAccmeanZ(1:31);
gyrobmeanx = test.tBodyGyromeanX(1:31);
gyrobmeany = test.tBodyGyromeanY(1:31);
gyrobmeanz = test.tBodyGyromeanZ(1:31);
gravityx = test.tGravityAccmeanX(1:31);
gravityy = test.tGravityAccmeanY(1:31);
gravityz = test.tGravityAccmeanZ(1:31);
%Datos Caminando
accbmeanx1 = test.tBodyAccmeanX(80:109);
accbmeany1 = test.tBodyAccmeanY(80:109);
accbmeanz1 = test.tBodyAccmeanZ(80:109);
gyrobmeanx1 = test.tBodyGyromeanX(80:109);
gyrobmeany1 = test.tBodyGyromeanY(80:109);
gyrobmeanz1 = test.tBodyGyromeanZ(80:109);
gravityx1 = test.tGravityAccmeanX(80:109);
gravityy1 = test.tGravityAccmeanY(80:109);
gravityz1 = test.tGravityAccmeanZ(80:109);
%Datos Sentado
accbmeanx2 = test.tBodyAccmeanX(32:55);
accbmeany2 = test.tBodyAccmeanY(32:55);
accbmeanz2 = test.tBodyAccmeanZ(32:55);
gyrobmeanx2 = test.tBodyGyromeanX(32:55);
gyrobmeany2 = test.tBodyGyromeanY(32:55);
gyrobmeanz2 = test.tBodyGyromeanZ(32:55);
gravityx2 = test.tGravityAccmeanX(32:55);
gravityy2 = test.tGravityAccmeanY(32:55);
gravityz2 = test.tGravityAccmeanZ(32:55);
%Datos Acostado
accbmeanx3 = test.tBodyAccmeanX(56:79);
accbmeany3 = test.tBodyAccmeanY(56:79);
accbmeanz3 = test.tBodyAccmeanZ(56:79);
gyrobmeanx3 = test.tBodyGyromeanX(56:79);
gyrobmeany3 = test.tBodyGyromeanY(56:79);
gyrobmeanz3 = test.tBodyGyromeanZ(56:79);
gravityx3 = test.tGravityAccmeanX(56:79);
gravityy3 = test.tGravityAccmeanY(56:79);
gravityz3 = test.tGravityAccmeanZ(56:79);
%Datos Bajando Escaleras
accbmeanx4 = test.tBodyAccmeanX(110:133);
accbmeany4 = test.tBodyAccmeanY(110:133);
accbmeanz4 = test.tBodyAccmeanZ(110:133);
gyrobmeanx4 = test.tBodyGyromeanX(110:133);
gyrobmeany4 = test.tBodyGyromeanY(110:133);
gyrobmeanz4 = test.tBodyGyromeanZ(110:133);
gravityx4 = test.tGravityAccmeanX(110:133);
gravityy4 = test.tGravityAccmeanY(110:133);
gravityz4 = test.tGravityAccmeanZ(110:133);
%Datos Subiendo Escaleras
accbmeanx5 = test.tBodyAccmeanX(134:158);
accbmeany5 = test.tBodyAccmeanY(134:158);
accbmeanz5 = test.tBodyAccmeanZ(134:158);
gyrobmeanx5 = test.tBodyGyromeanX(134:158);
gyrobmeany5 = test.tBodyGyromeanY(134:158);
gyrobmeanz5 = test.tBodyGyromeanZ(134:158);
gravityx5 = test.tGravityAccmeanX(134:158);
gravityy5 = test.tGravityAccmeanY(134:158);
gravityz5 = test.tGravityAccmeanZ(134:158);
%%
figuras('De Pie',accbmeanx,accbmeany,accbmeanz,gyrobmeanx,gyrobmeany,gyrobmeanz,gravityx,gravityy,gravityz)
figuras('Caminando',accbmeanx1,accbmeany1,accbmeanz1,gyrobmeanx1,gyrobmeany1,gyrobmeanz1,gravityx1,gravityy1,gravityz1)
figuras('Sentado',accbmeanx2,accbmeany2,accbmeanz2,gyrobmeanx2,gyrobmeany2,gyrobmeanz2,gravityx2,gravityy2,gravityz2)
figuras('Acostado',accbmeanx3,accbmeany3,accbmeanz3,gyrobmeanx3,gyrobmeany3,gyrobmeanz3,gravityx3,gravityy3,gravityz3)
figuras('Bajando Escaleras',accbmeanx4,accbmeany4,accbmeanz4,gyrobmeanx4,gyrobmeany4,gyrobmeanz4,gravityx4,gravityy4,gravityz4)
figuras('Subiendo Escaleras',accbmeanx5,accbmeany5,accbmeanz5,gyrobmeanx5,gyrobmeany5,gyrobmeanz5,gravityx5,gravityy5,gravityz5)

%% Grafica de clasificacion aceleracion lineal cuerpo 3D
accelerationmeanx = test.tBodyAccmeanX(:);
accelerationmeany = test.tBodyAccmeanY(:);
accelerationmeanz = test.tBodyAccmeanZ(:);
activity = test.Activity(:);
[~,~,id] = unique(activity)
colors = 'bkrgyc';
markers = '+o*.xs';
leyenda = ['standing','sitting','laying','walking','walking_downstairs','walking_upstairs']
meas = [accelerationmeanx accelerationmeany accelerationmeanz]
for idx = 1 : 6
    data = meas(id == idx,:);
    plot3(data(:,1), data(:,2), data(:,3), [colors(idx) markers(idx)]);
    legend('LAYING','SITTING','STANDING','WALKING','walking downstairs','walking upstairs')
    xlabel('Acceleration mean X') % x-axis label
    ylabel('Acceleration mean Y') % y-axis label
    zlabel('Acceleration mean Z') % z-axis label
    hold on;
end
grid; %// Show a grid

%% Grafica de clasificacion 3D gravedad
accelerationmeanx = test.tGravityAccmeanX(:);
accelerationmeany = test.tGravityAccmeanY(:);
accelerationmeanz = test.tGravityAccmeanZ(:);
activity = test.Activity(:);
[~,~,id] = unique(activity);
colors = 'bkrgyc';
markers = '+o*.xs';
leyenda = ['standing','sitting','laying','walking','walking_downstairs','walking_upstairs']
meas = [accelerationmeanx accelerationmeany accelerationmeanz]
for idx = 1 : 6
    data = meas(id == idx,:);
    plot3(data(:,1), data(:,2), data(:,3), [colors(idx) markers(idx)]);
    legend('LAYING','SITTING','STANDING','WALKING','walking downstairs','walking upstairs')
    xlabel('Gravity Acceleration mean X') % x-axis label
    ylabel('Gravity Acceleration mean Y') % y-axis label
    zlabel('Gravity Acceleration mean Z') % z-axis label
    hold on;
end
grid; %// Show a grid

%% Grafica de aceleracion angular cuerpo 3D
accelerationmeanx = test.tBodyGyromeanX(:);
accelerationmeany = test.tBodyGyromeanY(:);
accelerationmeanz = test.tBodyGyromeanZ(:);
activity = test.Activity(:);
[~,~,id] = unique(activity)
colors = 'bkrgyc';
markers = '+o*.xs';
leyenda = ['standing','sitting','laying','walking','walking_downstairs','walking_upstairs']
meas = [accelerationmeanx accelerationmeany accelerationmeanz]
for idx = 1 : 6
    data = meas(id == idx,:);
    plot3(data(:,1), data(:,2), data(:,3), [colors(idx) markers(idx)]);
    legend('LAYING','SITTING','STANDING','WALKING','walking downstairs','walking upstairs')
    xlabel('Gyroscope Acceleration mean X') % x-axis label
    ylabel('Gyroscope Acceleration mean Y') % y-axis label
    zlabel('Gyroscope Acceleration mean Z') % z-axis label
    hold on;
end
grid; %// Show a grid
