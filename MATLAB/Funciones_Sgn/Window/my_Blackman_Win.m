%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Blackman_Win.m
%
%   function my_Blackman_Win
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


function [signal] = my_Blackman_Win(x)

xN = size(x, 2);                                                                                % Mido el largo de la cadena de entrada
n = 0 : (xN - 1);                                                                               % Array de número de muestras 

w =  0.42 - 0.5*cos((2*pi*n)/(xN - 1)) - 0.08*cos((4*pi*n)/(xN - 1));                     % Array con las muestras de la ventana de Hanning

signal = x .* w;                                                                                % Señal con la ventana aplicada

end