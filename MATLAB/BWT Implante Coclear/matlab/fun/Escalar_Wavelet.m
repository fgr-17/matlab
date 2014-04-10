% -------------------------------------------------------------------------
%
%   Archivo:        Escalar_Wavelet.m
%
%   Descripcion:    Escala una wavelet
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Julian S.
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electronica.
%   Facultad Buenos Aires
%   Universidad Tecnologica Nacional
%
% -------------------------------------------------------------------------

function [w_escalada L] = Escalar_Wavelet(w_completa, t, a)
    
    L = length(w_completa);

    w0T = t(L) - t(1);                                                      % soporte completo de la ondita

    dt = t(2) - t(1);                                                       % Calculo la Ts de la Wavelet
    
    j = 0:(w0T* a);                                                         % ESTO SE PUEDE HACER MAS FACIL SIN NECESIDAD DE RECIBIR t COMO PARAMETRO
    j = j / (a * dt);                                                       % En escala 1 tengo 16+1 muestras. Puedo elegir desde 1/16 hasta 64                                       
	j = 1 + floor(j);                                                       % Me queda un espacio menos entre la 1er y segunda muestra. Despues están equiespaciadas

%     fprintf('\nEscala : %d\n', a);
%     fprintf('Muestras de la wavelet integrada y decimada\n');
%     fprintf('%f ', w_completa(j)); 
    
%     % -----------------------------------------------------------    
%     
%     fprintf('\nEscala : %d\n', a);
%     fprintf('Array de muestras j:\n');
%     fprintf('%d ', j);
%     
%     % ---------------------------------------------------------          
    
    w_escalada = w_completa(j);                                             % Decimo la función madre.
    L = length(w_escalada);                                                 % Retorno también el largo final después de decimar
end