cfriccion = 1;
angulop = 0.1047;
derrape = [16.475,21.8];

funcion = @(x) -0.0295.*x.^3 + 1.6936.*x.^2 - 32.068.*x + 218.39;
derivada = @(x) -0.0885.*x.^2+3.3872.*x-32.068;
derivada2 = @(x) -0.177.*x+3.3872;
rcurva = @(x) ((1 + derivada(x).^2)^(3/2))./derivada2(x);
vmax = @(r) sqrt(r*9.81*((cfriccion*cos(angulop)+sin(angulop))/(cos(angulop)-sin(angulop)*cfriccion)));
tangente1 = @(x) -0.2868597083818.*x+22.5659021427764;
tangente2 = @(x) -0.2868597017683.*x+24.8007627346778;



pistax = 13:.025:24;
pistay = (funcion(pistax).*1658.3)./39.37;
pistax = (pistax.* 1658.3)./39.37;
grada1x = [673.93,753.96,753.96,673.93,673.93];
grada1y = [800.3,789.77,800.3,810.83,800.3];
grada2x = [884.54,964.57,964.57,884.54,884.54];
grada2y = [812.93,802.403,812.93,823.46,812.93];

respuesta=0;

while respuesta<1 ||respuesta>3
   disp("1) Trayecto sin derrapes")
   disp("2) Trayecto con 1er derrape")
   disp("3) Trayecto con 2do derrape")
   respuesta=input("Opcion: ")
end


    plot(pistax,pistay);
    hold on
    plot(grada1x,grada1y);
    hold on
    plot(grada2x,grada2y);
    hold on
    t0 = ' ';
    t1 = ' ';
    t2 = ' ';
    t3 = ' ';
    t4 = ' ';
    t5=' ';
    t6=' ';

if respuesta==1
    distanciaTotal=0;
    tiempoTotal=0;
    for i = 13:.025:24
        distancias= sqrt(0.025^2+((funcion(i+0.025)-funcion(i)).^2)).*1658.3 ./39.37;
        distanciaTotal = distanciaTotal + distancias;
        x = (i .* 1658.37)/39.37;
        plot(pistax,pistay, 'b');
        hold on
        delete(t0); delete(t1); delete (t2); delete(t3), delete(t5), delete(t6);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O b')
        pause(0.001)
        v=3.6.*vmax((abs(rcurva(i)).*1658.3)./39.37);
        if v >320
            v=320;
        end
        tiempoTotal= tiempoTotal+ distancias/(v/3.6);
        t0 = text(900,950,['v (km/h) = ' num2str(v)]);
        t1 = text(900,935,['x = ' num2str(x)]);
        t2 = text(900,920,['y = ' num2str((funcion(i).*1658.3 )./ 39.37)]);
        t3 = text(900,905,['Radio C = ' num2str((abs(rcurva(i)).*1658.3)./39.37)]);
        t5= text(900,890,['Tiempo(seg)= ' num2str(tiempoTotal)]);
        t6=text(900,875,['Distancia(mts)= ' num2str(distanciaTotal)]);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O w')
        pause(0.001)
    end
end

if respuesta==2
    distanciaTotal=0;
    tiempoTotal=0;
for i = 13:.025:19
   distancias= sqrt(0.025^2+((funcion(i+0.025)-funcion(i)).^2)).*1658.3 ./39.37;
   distanciaTotal = distanciaTotal + distancias;
   x = (i .* 1658.37)/39.37;
   plot(pistax,pistay, 'b')
   hold on
    if i<derrape(1)
        delete(t0); delete(t1); delete (t2); delete(t3); delete(t4), delete(t5),delete(t6);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O b')
        pause(0.01)
        v=3.6.*vmax((abs(rcurva(i)).*1658.3)./39.37);
        if v >320
            v=320;
        end
        tiempoTotal= tiempoTotal+ distancias/(v/3.6);
        t0 = text(900,950,['v (km/h) = ' num2str(v)]);
        t1 = text(900,935,['x = ' num2str(x)]);
        t2 = text(900,920,['y = ' num2str((funcion(i).*1658.3 )./ 39.37)]);
        t3 = text(900,905,['Radio C = ' num2str((abs(rcurva(i)).*1658.3)./39.37)]);
        t5= text(900,890,['Tiempo(seg)= ' num2str(tiempoTotal)]);
        t6=text(900,875,['Distancia(mts)= ' num2str(distanciaTotal)]);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O w')
        pause(0.001)
    else
        delete (t4);
        plot(x,((tangente1(i).*1658.3 )./ 39.37),'* r')
        pause(0.01)
        t4 = text(750,860,['Peligro, el vehiculo ha salido de la pista']);
        plot(x,((tangente1(i).*1658.3 )./ 39.37),'* b')
        pause(0.001)
       
    end
      
            
end
end
if respuesta==3
    distanciaTotal=0;
    tiempoTotal=0;
for i = 13:.025:24
   distancias= sqrt(0.025^2+((funcion(i+0.025)-funcion(i)).^2)).*1658.3 ./39.37;
   distanciaTotal = distanciaTotal + distancias;
   x = (i .* 1658.37)/39.37;
   plot(pistax,pistay, 'b')
   hold on
    if i<derrape(2)
        delete(t0); delete(t1); delete (t2); delete(t3); delete(t4), delete(t5), delete(t6);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O b')
        pause(0.01)
        v=3.6.*vmax((abs(rcurva(i)).*1658.3)./39.37);
        if v >320
            v=320;
        end
        tiempoTotal= tiempoTotal+ distancias/(v/3.6);
        t0 = text(900,950,['v (km/h) = ' num2str(v)]);t1 = text(900,935,['x = ' num2str(x)]);
        t2 = text(900,920,['y = ' num2str((funcion(i).*1658.3 )./ 39.37)]);
        t3 = text(900,905,['Radio C = ' num2str((abs(rcurva(i)).*1658.3)./39.37)]);
        t5= text(900,890,['Tiempo(seg)= ' num2str(tiempoTotal)]);
        t6=text(900,875,['Distancia(mts)= ' num2str(distanciaTotal)]);
        plot(x,((funcion(i).*1658.3 )./ 39.37),'O w')
        pause(0.001)
    else
        delete (t4);
        plot(x,((tangente2(i).*1658.3 )./ 39.37),'* r')
        pause(0.01)
        t4 = text(750,860,['Peligro, el vehiculo ha salido de la pista']);
        plot(x,((tangente2(i).*1658.3 )./ 39.37),'* b')
        pause(0.001)
    end            
end
end