%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Adaptar_Coeficientes_FIR.m
%
%   Funci�n:
%       function [Wk yk ek] = Adaptar_Coeficientes_FIR(xk, dk, orden, mu);
%   
%   Par�metros de Entrada:
%   - xk:       Se�al de entrada
%   - dk:       Se�al deseada a adaptar
%   - orden:    Orden del filtro adaptativo FIR 
%   - mu:       Velocidad de convergencia del algoritmo
%
%   Par�metros de salida:
%   - Wk:       Pesos asignados 
%   - yk:       Se�al de Salida
%   - ek:       Se�al de Error 
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

function [Bk Ak yk ek] = Adaptar_Coeficientes_IIR(xk, dk, orden, mu)

coef_N = orden + 1;         % Cantidad de coeficientes del filtro

xN = size(xk, 2);           % Mido el largo de la se�al
dN = size(dk, 2);           % Mido el largo de la se�al a adaptar

% Elijo el menor de los largos para los arrays ek y yk:
if(xN > dN)
    eN = dN;
    yN = dN;
    N  = dN;
else
    eN = xN;
    yN = xN;
    N  = dN;    
end  

Bk = zeros(1, coef_N);      % Vector Inicial de Pesos del numerador
Ak = zeros(1, coef_N);      % Vector Inicial de Pesos del denominador

yk = zeros(1, yN);          % Se�al de salida inicial del FIR
ek = zeros(1, eN);          % Se�al inicial de error

for i = coef_N : N
    
    xk_i = fliplr(xk(1, (i - coef_N + 1):i));       % Tomo un sub-array de la se�al de entrada
    dk_i = fliplr(dk(1, (i - coef_N + 1):i));       % Tomo un sub-array de la se�al deseada
          
    yk(i) = (xk_i * Bk') + (dk_i * Ak');            % Calculo la muestra de salida con los coeficientes 
    
    ek(i) = dk(i) - yk(i);                          % Error
    
    Bk = Bk + (2 * mu * ek(i) * xk_i);              % Recalculo coeficientes directos
    Ak = Ak + (2 * mu * ek(i) * dk_i);              % Recalculo coeficientes inversos
end

end