%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Cancelacion_Ruido.m
%
%   Función:
%       function [yk] = Cancelacion_Ruido(Sgn_In, Ruido_Ref, L, mu)
%   
%   Parámetros de Entrada:
%   - Sgn_In:       Señal de entrada a filtrar
%   - Ruido_Ref:    Señal de ruido de referencia
%   - L:            Orden del filtro adaptativo FIR 
%   - mu :          (OPCIONAL) Velocidad de convergencia
%
%   Parámetros de salida:
%   - yk:       Señal de Salida sin la interferencia
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

function [ek] = Cancelacion_Ruido(Sgn_In, Ruido_Ref, L, mu)

if(nargin < 4)                              % Si no se ingresó el mu
    Pot_x = mean(Ruido_Ref .^ 2);           % Potencia de la señal de entrada
    mu = 1/(100*(L + 1) * Pot_x);           % Velocidad de convergencia
end

[Wk yk ek] = Adaptar_Coeficientes_FIR(Ruido_Ref, Sgn_In, L, mu);

end