%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   function [ sgn_out] = SubMuestrear( sgn_in, M)
%
%   Par�metros de Entrada :
%
%       sgn     : Se�al a sobremuestrear
%       M       : Coeficiente del decimador
%
%   Par�metros de salida :
% 
%       sgn_out : Se�al submuestreada
%
%   Fecha de creaci�n   : 30.05.2012
%   �ltima Modificaci�n : 30.05.2012
%
%   Autor : ROUX, Federico G.(rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [sgn_out] = SobreMuestrear(sgn_in, M)

L = size(sgn_in, 2);                                                                % Obtengo el largo de la se�al
sgn_out = zeros(1, M*L);                                                            % Creo un array de zeros con largo M*L
sgn_out(1, 1:M:(L*M)) = sgn_in;                                                     % Guardo las muestras espaciadas entre M-1 ceros

end