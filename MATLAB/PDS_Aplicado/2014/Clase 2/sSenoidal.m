%% ========================================================================
%
%>  @file sSenoidal.m
%
%>  @brief Síntesis de una señal senoidal a partir de parámetros
%
%>  @param[in]  A       Amplitud de la señal
%>  @param[in]  f0      Frecuencia fundamental de la señal
%>  @param[in]  ph0     Fase inicial de la señal
%>  @param[in]  N       Cantidad de muestras de la señal
%>  @param[in]  Fs      Frecuencia de muestreo de la señal 
%
%>  @return     x       Array de muestras de la señal sintetizada
%>  @return     t       Array de tiempo asociado a la señal
%
%>  @author     Roux, Federico G. (froux@favaloro.edu.ar)
%>  @date       04/2013
%>  @company    UNIVERSIDAD FAVALORO
% =========================================================================

%% ========================================================================
function [x t] = sSenoidal(A, f0, ph0, N, Fs)

Ts = 1 / Fs;                                                                % Período de muestreo
k = 0: (N - 1);                                                             % Array de muestras
t = k*Ts;                                                                   % Array de tiempo

w0 = 2*pi*f0;                                                               % Pulsación fundamental

x = A * sin(w0*t + ph0);

end 