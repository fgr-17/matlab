%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : LPF_FIR_Ventana.m
%
%   Función:
%       function [h_k] = LPF_FIR_Ventana(fc, N, fs, win)
%   
%   Parámetros de Entrada:
%   - fc:       Frecuencia de corte del filtro
%   - N:        Cantidad de coeficientes del filtro
%   - fs:       Frecuencia de muestreo utilizada
%
%   Parámetros de salida:
%   - hk:       Coeficientes del filtro
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%   
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [h_k t] = LPF_FIR_Ventana(fc, N, fs, win)

t0 = (N - 1)/2 ;                                                            % retardo para centrar la respuesta en frecuencia
wc = 2*pi*fc/fs;                                                            % Pulsación de corte
A = (wc/ pi);                                                               % Amplitud normalizada


[h_k t] = mySinc(A, fc, t0 ,N , fs);                                        % Genero la función Sinc
switch(win)
    
    case 'rectangular'
        h_k = h_k * 1;                                                      % En ventana rectangular, queda igual
                
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
        h_k = 0; t = 0;
end

end