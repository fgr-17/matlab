%% ========================================================================
%
%>  @file sSenoidal.m
%
%>  @brief S�ntesis de una se�al senoidal a partir de par�metros
%
%>  @param[in]  A       Amplitud de la se�al
%>  @param[in]  f0      Frecuencia fundamental de la se�al
%>  @param[in]  ph0     Fase inicial de la se�al
%>  @param[in]  N       Cantidad de muestras de la se�al
%>  @param[in]  Fs      Frecuencia de muestreo de la se�al 
%
%>  @return     x       Array de muestras de la se�al sintetizada
%>  @return     t       Array de tiempo asociado a la se�al
%
%>  @author     Roux, Federico G. (froux@favaloro.edu.ar)
%>  @date       04/2013
%>  @company    UNIVERSIDAD FAVALORO
% =========================================================================

%% ========================================================================
function [x t] = sSenoidal(A, f0, ph0, N, Fs)

Ts = 1 / Fs;                                                                % Per�odo de muestreo
k = 0: (N - 1);                                                             % Array de muestras
t = k*Ts;                                                                   % Array de tiempo

w0 = 2*pi*f0;                                                               % Pulsaci�n fundamental

x = A * sin(w0*t + ph0);

end 