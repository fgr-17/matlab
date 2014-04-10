%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Corr.m
%
%   function my_Corr
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [signal signalN] = my_Corr(x, h)

hN = size(h, 2);                                                                % Largo de la 1er señal
xN = size(x, 2);                                                                % Largo de la segunda señal

% x_corr_N = xN + (2 * hN) - 2;
yN = hN + xN - 1;                                                               % Cantidad de muestras de la señal de salida
signal = zeros(1, yN);                                                          % Inicializo con ceros la señal de salida

bloque_z = zeros(1, hN - 1);                                                    % Genero un vector de ceros a agregar a la señal
x_exp(1, :) = [bloque_z x bloque_z];                                            % Agrego ceros para multiplicar por cero hasta la entrada completa de h[n] en x[n]

for i = 1 : yN

    signal(i) = 0;                                                              % inicializo el elemento i
    ind_signal = i;                                                             % indice del array a guardar
    
    for j = 1 : hN
        
        % ind_h = hN - (j - 1);                                                 % indice de la señal que correlaciona: cuenta hacia atrás igual en todas las iteraciones.
        ind_h = j;                                                              % indice de la señal que correlaciona: cuenta hacia adelante desplazada (i-1) veces
        ind_x_exp = (i - 1) + j;                                                % indice de la señal a correlacionar: cuenta hacia adelante desplazada (i-1) veces
        
        signal(ind_signal) = signal(ind_signal) + h(ind_h) * x_exp(ind_x_exp);  % suma de convolución
    
    end
end

signalN = yN;

end