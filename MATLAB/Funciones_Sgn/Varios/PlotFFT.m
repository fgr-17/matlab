%> \file PlotFFT.m
%> \brief Funciones accesorias
%> \author Federico G. Roux (rouxfederico@gmail.com)
%> \author UTN FRBA - DSPRT
%> \date 08.04.2010
%> \version 1.0.4	
%> \note: Funciones adicionales
%--------------------------------------------------------------------------
%> \brief Grafica el espectro de una se�al
%> \param sgn  = array con las muestras de la se�al
%> \param fs   = Frecuencia a la que fue sampleada la se�al
%> \param titulo = Titulo del gr�fico
%> \param mode = 0->plot // 1->stem
%> \param ylab = etiqueta del eje Y
%>
%> \return espectro = Array de N muestras con el espectro de la se�al
%> \return img      = Handler de la figura
%>
%> \warning -
%> \bug -
%> \todo Validar valor de par�metros
%> \todo Validar cantidad de par�metros

function [espectro img] = PlotFFT(sgn, fs, titulo, mode, ylab)

margenY = 0.1;                                              % m�rgen porcentual en el eje y
margenF = 0.1;                                              % m�rgen porcentual en el eje de freq.

N = size(sgn, 2);

espectro = fft(sgn);                  	                    % hago la fft de la se�al
% espectro = fftshift(espectro);                              % corro el espectro para que tenga su centro en cero
espectro = abs(espectro);                                   % calculo el m�dulo de las muestras

res_esp = fs/N;                                             % calculo la resoluci�n espectral
f = 0 : N - 1;                                              % armo el eje de frecuencia en muestras
f = f * res_esp;                                            % escalo el eje de frecuencia en la resoluci�n espectral

% f = f - fs/2;                                               % cambio el centro del eje de frecuencias a cero

% ------------------ NOTA: compatibilidad de par�metros -------------------
% Para mantener la compatibilidad hacia versiones anteriores de �sta
% funci�n, se chequea la cantidad de par�metros antes de realizar alguna
% acci�n. De �ste modo, adem�s se puede llamar a la funci�n de una manera
% m�s simple(como en la primer versi�n) sin que deje de funcionar.
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

maximo = max(espectro);                                     % Calculo el m�ximo de la se�al
minimo = min(espectro);                                     % Calculo el m�nimo de la se�al

if(minimo == maximo)                                        % Ajusto un extremo a cero en caso que sean iguales
    if(maximo > 0) 
        minimo = 0;
    else
        maximo = 1;
    end
end

% L�mites del gr�fico:
fmin = min(f)*(1 + margenF);
fmax = max(f)*(1 + margenF);

ymin = minimo*(1 - margenY);
ymax = maximo*(1 + margenY);

xlim([fmin fmax]);
ylim([ymin ymax]);
xlabel('f[Hz]');
ylabel(sprintf('%s%s%s', '|', ylab, '|'));                  % Muestro: m�dulo de la se�al
grid on;

end