function figuras(Nombre_Actividad,accx,accy,accz,gyrx,gyry,gyrz,gravityx,gravityy,gravityz)
figure('Name',Nombre_Actividad)
subplot(3,3,1)       % add first plot in 2 x 1 grid
plot(accx)
title('Aceleración Media del Cuerpo en X')

subplot(3,3,4)       % add second plot in 2 x 1 grid
plot(accy)       % plot using + markers
title('Aceleración Media del Cuerpo en Y')

subplot(3,3,7)       % add second plot in 2 x 1 grid
plot(accz)       % plot using + markers
title('Aceleración Media del Cuerpo en Z')

subplot(3,3,2)       % add second plot in 2 x 1 grid
plot(gyrx)       % plot using + markers
title('Aceleración angular Media del Cuerpo en X')

subplot(3,3,5)       % add second plot in 2 x 1 grid
plot(gyry)       % plot using + markers
title('Aceleración angular Media del Cuerpo en Y')

subplot(3,3,8)       % add second plot in 2 x 1 grid
plot(gyrz)       % plot using + markers
title('Aceleración angular Media del Cuerpo en Z')

subplot(3,3,3)       % add second plot in 2 x 1 grid
plot(gravityx)       % plot using + markers
title('Aceleración Media de la Gravedad en X')

subplot(3,3,6)       % add second plot in 2 x 1 grid
plot(gravityy)       % plot using + markers
title('Aceleración Media de la Gravedad en Y')

subplot(3,3,9)       % add second plot in 2 x 1 grid
plot(gravityz)       % plot using + markers
title('Aceleración Media de la Gravedad en Z')