%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [ sgn_out] = SubMuestrear( sgn_in, M)
%
%   Parámetros de Entrada :
%
%       sgn     : Señal a sobremuestrear
%       M       : Coeficiente del decimador
%
%   Parámetros de salida :
% 
%       sgn_out : Señal submuestreada
%
%   Fecha de creación   : 30.05.2012
%   Última Modificación : 30.05.2012
%
%   Autor : ROUX, Federico G.(rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [sgn_out] = SobreMuestrear(sgn_in, M)

L = size(sgn_in, 2);                                                                % Obtengo el largo de la señal
sgn_out = zeros(1, M*L);                                                            % Creo un array de zeros con largo M*L
sgn_out(1, 1:M:(L*M)) = sgn_in;                                                     % Guardo las muestras espaciadas entre M-1 ceros

end