%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [ sgn_out] = SubMuestrear( sgn_in, M)
%
%   Parámetros de Entrada :
%
%       sgn     : Señal a submuestrear
%       M       : Coeficiente del decimador
%
%   Parámetros de salida :
% 
%       sgn_out : Señal submuestreada
%
%   Fecha de creación   : 19-01-2011
%   Última Modificación : 19-01-2011
%
%   Autor : ROUX, Federico G.(rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [ sgn_out] = SubMuestrear( sgn_in, M)

sgn_in_len  = size( sgn_in, 2) ;            % Largo de la señal de entrada

sgn_out_len = ceil( sgn_in_len / M) ;       % Largo de la señal submuestreada

sgn_out     = zeros( 1, sgn_out_len) ;      % Defino la señal con ceros

sgn_out_ind = 1 : sgn_out_len ;             % Índice de la señal de salida

sgn_in_ind  = ((sgn_out_ind - 1) * M ) + 1 ;% Índice de la señal de entrada

sgn_out (sgn_out_ind) = sgn_in ( sgn_in_ind) ;

end