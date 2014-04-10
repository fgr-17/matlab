%> \file myConv.m
%> \brief 	Convolución de dos Señales
%> \author Federico G. Roux (rouxfederico@gmail.com)
%> \author UTN FRBA - DSPRT
%> \date 04.05.2010
%> \version 1.0.0	
%> \note: TP#2: Función del Ejercicio 3
%--------------------------------------------------------------------------

%> \brief Realiza la convolución de dos señales
%> \param   h :Señal a convolucionar.
%> \param   x: Señal a convolucionar.
%> \param   hN : Largo de la señal h.
%> \param   xN : Largo de la señal x.
%>
%> \return  signal: Vector con la señal generada.
%> \return  signalN: Cantidad de muestras de signal.
%>
%> \warning -
%> \bug -
%> \todo Validar valor de parámetros
%> \todo Validar cantidad de parámetros

function [signal signalN] = myConv(h, x)

hN = size(h, 2);
xN = size(x, 2);

x_convN = (xN + 2)*(hN - 2);
yN = hN + xN - 1;
signal = zeros(1, yN);

bloque_z = zeros(1, hN - 1);                                            % Genero un vector de ceros a agregar a la señal
x_conv(1, :) = [bloque_z x bloque_z];                                   % Agrego ceros para multiplicar por cero hasta la entrada completa de h[n] en x[n]


for i = 1:yN
    signal(i) = 0;                                                      % inicializo el elemento i
    for j = 1:hN
        ind_signal = i;                                                 % indice del array a guardar
        ind_h = hN - (j - 1);                                           % indice de la señal que convoluciona: cuenta hacia atrás igual en todas las iteraciones.
        ind_x_conv = (i - 1) + j;                                       % indice de la señal a convolucinar: cuenta hacia adelante desplazada (i-1) veces
        
        signal(ind_signal) = signal(ind_signal) + h(ind_h) * x_conv(ind_x_conv);    % suma de convolución
    end
end

signalN=yN;


end