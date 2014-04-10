%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Filtro_Predictivo.m
%
%   Función:
%       yk = Filtro_Predictivo(Sgn_In, L, retardo)
%   
%   Parámetros de Entrada:
%   - Sgn_In:       Señal de entrada a filtrar
%   - L:            Orden del filtro adaptativo FIR 
%   - retardo:      Retardo del filtro predictivo
%   - mu :          (OPCIONAL) Velocidad de convergencia
%
%   Parámetros de salida:
%   - yk:       Señal Filtrada
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

function [yk t]= Filtro_Predictivo(Sgn_In, L, retardo, mu)

if(nargin < 4)                              % Si no se ingresó el mu, se calcula
    Pot_x = mean(Sgn_In .^ 2);              % Potencia de la señal de entrada
    mu = 1/(100*(L + 1) * Pot_x);           % Velocidad de convergencia
end

N = size(Sgn_In, 2);                       

Sgn_In_Sub = Sgn_In(1: (N - retardo));

Sgn_Ret(1: (N - retardo)) = Sgn_In((1 + retardo):N);

[a b yk] = Adaptar_Coeficientes_FIR(Sgn_Ret, Sgn_In_Sub, L, mu);

t = 1:(N - retardo);

end