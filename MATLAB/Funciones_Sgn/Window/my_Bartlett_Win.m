%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Hamming_Win.m
%
%   function my_Hamming_Win
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [signal] = my_Bartlett_Win(x)

xN = size(x, 2);                                                                                % Mido el largo de la cadena de entrada
n = 0 : (xN - 1);                                                                               % Array de número de muestras 
    
if xN == 1                                                                                      % Si se hace el vivo con una muestra sola
    signal = 1;                                                                                 % La ventana es un uno
    return;                                                                                     % Retorno
elseif(mod(xN, 2) == 0)                                                                         % Pregunto si el número de muestras es par    
    w(1: (xN / 2)) = (2 / (xN - 1)) * (0: (xN / 2 - 1));                                        % Mitad ascendente de la ventana
    w((xN / 2) + 1: xN) = (-2/(xN - 1   ))*(((xN / 2):xN - 1) - xN + 1);                        % Mitad descendente de la ventana
else                                                                                            % Si la cantidad de muestras es impar   
    w(1:((xN - 1)/ 2)) = (2/(xN - 2))*(0 : ((xN - 3)/2));                                       % Mitad ascendente de la ventana
    w(((xN + 3)/ 2): xN) = (-2/(xN - 2))*((((xN + 5)/2):xN) - xN + 1);                          % Mitad descendente de la ventana
    w(((xN - 1)/ 2) + 2) = 1;                                                                   % Muestra del medio
end 

signal = x .* w;                                                                                % Señal con la ventana aplicada

end