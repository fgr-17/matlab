%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   function [ sgn_out] = SubMuestrear( sgn_in, M)
%
%   Par�metros de Entrada :
%
%       sgn     : Se�al a submuestrear
%       M       : Coeficiente del decimador
%
%   Par�metros de salida :
% 
%       sgn_out : Se�al submuestreada
%
%   Fecha de creaci�n   : 19-01-2011
%   �ltima Modificaci�n : 19-01-2011
%
%   Autor : ROUX, Federico G.(rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [ sgn_out] = SubMuestrear( sgn_in, M)

sgn_in_len  = size( sgn_in, 2) ;            % Largo de la se�al de entrada

sgn_out_len = ceil( sgn_in_len / M) ;       % Largo de la se�al submuestreada

sgn_out     = zeros( 1, sgn_out_len) ;      % Defino la se�al con ceros

sgn_out_ind = 1 : sgn_out_len ;             % �ndice de la se�al de salida

sgn_in_ind  = ((sgn_out_ind - 1) * M ) + 1 ;% �ndice de la se�al de entrada

sgn_out (sgn_out_ind) = sgn_in ( sgn_in_ind) ;

end