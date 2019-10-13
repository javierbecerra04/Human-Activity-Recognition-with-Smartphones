% EXTRACCIÓN DE DATOS
tic
listing = dir('C:\Users\TG1808\OneDrive\TESIS\Mediciones');
for(i=3:length(listing))
    if (listing(i).isdir==1)
        list2=dir(fullfile(listing(i).folder,listing(i).name));
        list3=dir(fullfile(list2(3).folder,list2(3).name));
            for (j=3:length(list3))
                if (list3(j).isdir==1)
                    if (j==3) && (i==3)
                        filename = fullfile(list3(j).folder,list3(j).name,'Accelerometer.csv');
                        filename2 = fullfile(list3(j).folder,list3(j).name,'Gyroscope.csv');
                        label = saber_label(list3(j).name);
                        Accelerometer_aux = importdatos(filename,label);
                        Accelerometer = [Accelerometer_aux(find(abs(Accelerometer_aux(:,1))<14000),2:5)];
                        Gyroscope_aux = importdatos(filename2,label);
                        Gyroscope = [Gyroscope_aux(find(abs(Gyroscope_aux(:,1))<14000),2:5)];
                    end
                    if j>3
                        filename = fullfile(list3(j).folder,list3(j).name,'Accelerometer.csv');
                        filename2 = fullfile(list3(j).folder,list3(j).name,'Gyroscope.csv');
                        label = saber_label(list3(j).name);
                        Accelerometer_aux = importdatos(filename,label);
                        Accelerometer = [Accelerometer;Accelerometer_aux(find(abs(Accelerometer_aux(:,1))<14000),2:5)];
                        Gyroscope_aux = importdatos(filename2,label);
                        Gyroscope = [Gyroscope;Gyroscope_aux(find(abs(Gyroscope_aux(:,1))<14000),2:5)];
                    end
                end
            end
    end
end
toc