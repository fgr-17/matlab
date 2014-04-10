%> \file PlotFFT.m
%> \brief Funciones accesorias
%> \author Federico G. Roux (rouxfederico@gmail.com)
%> \author UTN FRBA - DSPRT
%> \date 08.04.2010
%> \version 1.0.4	
%> \note: Funciones adicionales
%--------------------------------------------------------------------------
%> \brief Grafica el espectro de una señal
%> \param sgn  = array con las muestras de la señal
%> \param fs   = Frecuencia a la que fue sampleada la señal
%> \param titulo = Titulo del gráfico
%> \param mode = 0->plot // 1->stem
%> \param ylab = etiqueta del eje Y
%>
%> \return espectro = Array de N muestras con el espectro de la señal
%> \return img      = Handler de la figura
%>
%> \warning -
%> \bug -
%> \todo Validar valor de parámetros
%> \todo Validar cantidad de parámetros

function [espectro img] = PlotFFT(sgn, fs, titulo, mode, ylab)

margenY = 0.1;                                              % márgen porcentual en el eje y
margenF = 0.1;                                              % márgen porcentual en el eje de freq.

N = size(sgn, 2);

espectro = fft(sgn);                  	                    % hago la fft de la señal
% espectro = fftshift(espectro);                              % corro el espectro para que tenga su centro en cero
espectro = abs(espectro);                                   % calculo el módulo de las muestras

res_esp = fs/N;                                             % calculo la resolución espectral
f = 0 : N - 1;                                              % armo el eje de frecuencia en muestras
f = f * res_esp;                                            % escalo el eje de frecuencia en la resolución espectral

% f = f - fs/2;                                               % cambio el centro del eje de frecuencias a cero

% ------------------ NOTA: compatibilidad de parámetros -------------------
% Para mantener la compatibilidad hacia versiones anteriores de ésta
% función, se chequea la cantidad de parámetros antes de realizar alguna
% acción. De éste modo, además se puede llamar a la función de una manera
% más simple(como en la primer versión) sin que deje de funcionar.
% -------------------------------------------------------------------------

if(nargin >= 4)
    if(mode == 0)     
        img = plot(f, espectro, '-b', 'LineWidth', 2);                      % grafico modo Plot
    elseif(mode == 1)
        img = stem(f, espectro);                                            % grafico modo Stem
    end
else
    ylab = 'A(f)';
    img = plot(f, espectro, '-b', 'LineWidth', 2);                          % Plot por default
end

if(nargin >= 3)
    titulo = sprintf('%s R:%.2fHz', titulo, res_esp);
    title(titulo);
end

maximo = max(espectro);                                     % Calculo el máximo de la señal
minimo = min(espectro);                                     % Calculo el mínimo de la señal

if(minimo == maximo)                                        % Ajusto un extremo a cero en caso que sean iguales
    if(maximo > 0) 
        minimo = 0;
    else
        maximo = 1;
    end
end

% Límites del gráfico:
fmin = min(f)*(1 + margenF);
fmax = max(f)*(1 + margenF);

ymin = minimo*(1 - margenY);
ymax = maximo*(1 + margenY);

xlim([fmin fmax]);
ylim([ymin ymax]);
xlabel('f[Hz]');
ylabel(sprintf('%s%s%s', '|', ylab, '|'));                  % Muestro: módulo de la señal
grid on;

end