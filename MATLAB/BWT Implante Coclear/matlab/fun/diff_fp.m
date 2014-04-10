% -------------------------------------------------------------------------
%
%   Archivo:        diff_FP.m
%
%   Descripci�n:    Diferenciacion de 1er orden de un array en punto fijo
%
%   Par�metros:     x : Array a diferenciar
%                   WordLength : Cantidad de bits del ADC simulado
%                   FractLength : Cantidad de bits de parte fraccionaria
%
%   Devuelve:       y: Array en punto fijo diferenciado
%                   yN: Cantidad de muestras de signal.
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Juli�n S.
%   RT-DSP, Departamento de Ing.Electr�nica.
%   03/2012 UTN-BA
% -------------------------------------------------------------------------

function [y yN] = diff_fp(x)

xN = size(x, 2);                                                            % Calculo el largo del array

x_data = x.data;                                                            % Copio el array num�rico del FI object
x_data_diff = diff(x_data);                                                 % Diferencio el array num�rico

y = x;
y.data = x_data_diff;


end