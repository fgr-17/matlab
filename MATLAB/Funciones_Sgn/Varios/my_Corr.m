%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Corr.m
%
%   function my_Corr
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [signal signalN] = my_Corr(x, h)

hN = size(h, 2);                                                                % Largo de la 1er se�al
xN = size(x, 2);                                                                % Largo de la segunda se�al

% x_corr_N = xN + (2 * hN) - 2;
yN = hN + xN - 1;                                                               % Cantidad de muestras de la se�al de salida
signal = zeros(1, yN);                                                          % Inicializo con ceros la se�al de salida

bloque_z = zeros(1, hN - 1);                                                    % Genero un vector de ceros a agregar a la se�al
x_exp(1, :) = [bloque_z x bloque_z];                                            % Agrego ceros para multiplicar por cero hasta la entrada completa de h[n] en x[n]

for i = 1 : yN

    signal(i) = 0;                                                              % inicializo el elemento i
    ind_signal = i;                                                             % indice del array a guardar
    
    for j = 1 : hN
        
        % ind_h = hN - (j - 1);                                                 % indice de la se�al que correlaciona: cuenta hacia atr�s igual en todas las iteraciones.
        ind_h = j;                                                              % indice de la se�al que correlaciona: cuenta hacia adelante desplazada (i-1) veces
        ind_x_exp = (i - 1) + j;                                                % indice de la se�al a correlacionar: cuenta hacia adelante desplazada (i-1) veces
        
        signal(ind_signal) = signal(ind_signal) + h(ind_h) * x_exp(ind_x_exp);  % suma de convoluci�n
    
    end
end

signalN = yN;

end