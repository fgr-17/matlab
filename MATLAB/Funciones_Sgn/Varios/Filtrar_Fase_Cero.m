%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Filtrar_Fase_Cero.m
%
%   Funci�n:
%       function [yk] = Filtrar_Fase_Cero(bk, ak, xk);
%   
%   Par�metros de Entrada:
%   - xk:       Se�al de entrada
%   - bk:       Coeficientes directos del filtro
%   - ak:       Coeficientes inversos del filtro
%
%   Par�metros de salida:
%   - yk:       Se�al de Salida
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

function [yk] = Filtrar_Fase_Cero(bk, ak, xk)

rk = filter(bk, ak, xk);        % rk es la se�al filtrada normalmente

r_k = fliplr(rk);               % Invierto la se�al anterior

gk = filter(bk, ak, r_k);       % Vuelvo a filtrar la se�al invertida

yk = fliplr(gk);                % Obtengo la se�al sin distorsi�n de fase

end