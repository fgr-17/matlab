%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : HPF_FIR_Ventana.m
%
%   Funci�n:
%       function [h_k] = HPF_FIR_Ventana(fc, N, fs, win)
%   
%   Par�metros de Entrada:
%   - fc:       Frecuencia de corte del filtro
%   - N:        Cantidad de coeficientes del filtro
%   - fs:       Frecuencia de muestreo utilizada
%
%   Par�metros de salida:
%   - hk:       Coeficientes del filtro
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%   
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [h_k t] = HPF_FIR_Ventana(fc, N, fs, win)

t0 = (N - 1)/2 ;                                                                    % Retardo para centrar la respuesta en frecuencia
wc = 2*pi*fc/fs;                                                                    % Pulsaci�n de corte
A = (pi - wc)/pi;                                                                   % Amplitud normalizada

[h_k t] = mySinc(A, (fs - 2*fc)/2, t0, N, fs);                                      % Genero la funci�n Sinc
alt = (-1).^(0:(N - 1));                                                            % Array para alternar el signo
h_k = h_k .* alt;                                                                   % Alterno el signo de las muestras

switch(win)
    
    case 'rectangular'                                                              % Ventana Rectangular        
        h_k = h_k * 1;

    case 'bartlett'
        h_k = my_Bartlett_Win(h_k);
        
    case 'blackman'
        h_k = my_Blackman_Win(h_k);
                   
    case 'hamming'
        h_k = my_Hamming_Win(h_k);        
    
    case 'hanning'
        h_k = my_Hanning_Win(h_k);
        
    case 'triangular'
        h_k = my_Triangular_Win(h_k);
        
    otherwise
        h_k = 0;
        t = 0;
        
end

end