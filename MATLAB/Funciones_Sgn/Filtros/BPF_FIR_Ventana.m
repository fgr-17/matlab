%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : BPF_FIR_Ventana.m         Filtro pasabanda
%
%   Función:
%       function [h_k] = BPF_FIR_Ventana(f1, f2, N, fs, win)
%   
%   Parámetros de Entrada:
%   - f1:       Frecuencia de inicio de la banda de paso
%   - f2:       Frecuencia de fin de la banda de paso 
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

function [h_k t] = BPF_FIR_Ventana(f1, f2, N, fs, win)

[h2_k t] = LPF_FIR_Ventana(f2, N, fs, 'rectangular');
[h1_k t]= LPF_FIR_Ventana(f1, N, fs, 'rectangular');
        
h_k = h2_k - h1_k;

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