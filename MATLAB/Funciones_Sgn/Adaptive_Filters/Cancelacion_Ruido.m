%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Cancelacion_Ruido.m
%
%   Funci�n:
%       function [yk] = Cancelacion_Ruido(Sgn_In, Ruido_Ref, L, mu)
%   
%   Par�metros de Entrada:
%   - Sgn_In:       Se�al de entrada a filtrar
%   - Ruido_Ref:    Se�al de ruido de referencia
%   - L:            Orden del filtro adaptativo FIR 
%   - mu :          (OPCIONAL) Velocidad de convergencia
%
%   Par�metros de salida:
%   - yk:       Se�al de Salida sin la interferencia
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

function [ek] = Cancelacion_Ruido(Sgn_In, Ruido_Ref, L, mu)

if(nargin < 4)                              % Si no se ingres� el mu
    Pot_x = mean(Ruido_Ref .^ 2);           % Potencia de la se�al de entrada
    mu = 1/(100*(L + 1) * Pot_x);           % Velocidad de convergencia
end

[Wk yk ek] = Adaptar_Coeficientes_FIR(Ruido_Ref, Sgn_In, L, mu);

end