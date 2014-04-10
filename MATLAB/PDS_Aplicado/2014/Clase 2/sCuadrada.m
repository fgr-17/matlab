%% =========================================================================
%
%>  @file       sCuadrada.m
%
%>  @brief      Sintesis de una se�al cuadrada.
%
%>  @param[in]  N       Longitud de la se�al
%>  @param[in]  A       Valor Pico
%>  @param[in]  N       Per�odo de la secuencia
%>  @param[in]  duty    Ciclo de trabajo
%>  @param[in]  fs      Frecuencia de Sampleo
%
%>  @return     sgn     array de muestras de la se�al cuadrada
%>  @return     t_axis  Eje temporal 
%
%>  @author     Roux, Federico G. (froux@favaloro.edu.ar)
%>  @date       04/2013
%>  @company    UNIVERSIDAD FAVALORO
% =========================================================================

%% ========================================================================
function [s t] = sCuadrada(A, f0, N, duty, fs)

Ts = 1 / fs;                                                            % Per�odo de muestreo
t0 = 0 ;                                                                % Instante inicial de la se�al
tf = (N - 1) * Ts;                                                      % Instante de finalizaci�n de la se�al

t = t0:Ts:tf ;                                                     % Eje temporal de la se�al

w0 = (2*pi*f0);                                                         % Pulsaci�n fundamental de la se�al

s = A * square(w0 * t, duty);                                    % Genero la se�al

end