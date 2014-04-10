%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Filtrar_Fase_Cero.m
%
%   Función:
%       function [yk] = Filtrar_Fase_Cero(bk, ak, xk);
%   
%   Parámetros de Entrada:
%   - xk:       Señal de entrada
%   - bk:       Coeficientes directos del filtro
%   - ak:       Coeficientes inversos del filtro
%
%   Parámetros de salida:
%   - yk:       Señal de Salida
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

function [yk] = Filtrar_Fase_Cero(bk, ak, xk)

rk = filter(bk, ak, xk);        % rk es la señal filtrada normalmente

r_k = fliplr(rk);               % Invierto la señal anterior

gk = filter(bk, ak, r_k);       % Vuelvo a filtrar la señal invertida

yk = fliplr(gk);                % Obtengo la señal sin distorsión de fase

end