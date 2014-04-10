%% =========================================================================
%
%>  @file       sCuadrada.m
%
%>  @brief      Sintesis de una señal cuadrada.
%
%>  @param[in]  N       Longitud de la señal
%>  @param[in]  A       Valor Pico
%>  @param[in]  N       Período de la secuencia
%>  @param[in]  duty    Ciclo de trabajo
%>  @param[in]  fs      Frecuencia de Sampleo
%
%>  @return     sgn     array de muestras de la señal cuadrada
%>  @return     t_axis  Eje temporal 
%
%>  @author     Roux, Federico G. (froux@favaloro.edu.ar)
%>  @date       04/2013
%>  @company    UNIVERSIDAD FAVALORO
% =========================================================================

%% ========================================================================
function [s t] = sCuadrada(A, f0, N, duty, fs)

Ts = 1 / fs;                                                            % Período de muestreo
t0 = 0 ;                                                                % Instante inicial de la señal
tf = (N - 1) * Ts;                                                      % Instante de finalización de la señal

t = t0:Ts:tf ;                                                     % Eje temporal de la señal

w0 = (2*pi*f0);                                                         % Pulsación fundamental de la señal

s = A * square(w0 * t, duty);                                    % Genero la señal

end