%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Adaptar_Coeficientes_FIR.m
%
%   Función:
%       function [Wk yk ek] = Adaptar_Coeficientes_FIR(xk, dk, orden, mu);
%   
%   Parámetros de Entrada:
%   - xk:       Señal de entrada
%   - dk:       Señal deseada a adaptar
%   - orden:    Orden del filtro adaptativo FIR 
%   - mu:       Velocidad de convergencia del algoritmo
%
%   Parámetros de salida:
%   - Wk:       Pesos asignados 
%   - yk:       Señal de Salida
%   - ek:       Señal de Error 
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

function [Bk Ak yk ek] = Adaptar_Coeficientes_IIR(xk, dk, orden, mu)

coef_N = orden + 1;         % Cantidad de coeficientes del filtro

xN = size(xk, 2);           % Mido el largo de la señal
dN = size(dk, 2);           % Mido el largo de la señal a adaptar

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

yk = zeros(1, yN);          % Señal de salida inicial del FIR
ek = zeros(1, eN);          % Señal inicial de error

for i = coef_N : N
    
    xk_i = fliplr(xk(1, (i - coef_N + 1):i));       % Tomo un sub-array de la señal de entrada
    dk_i = fliplr(dk(1, (i - coef_N + 1):i));       % Tomo un sub-array de la señal deseada
          
    yk(i) = (xk_i * Bk') + (dk_i * Ak');            % Calculo la muestra de salida con los coeficientes 
    
    ek(i) = dk(i) - yk(i);                          % Error
    
    Bk = Bk + (2 * mu * ek(i) * xk_i);              % Recalculo coeficientes directos
    Ak = Ak + (2 * mu * ek(i) * dk_i);              % Recalculo coeficientes inversos
end

end