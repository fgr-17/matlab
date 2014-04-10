%%=========================================================================================================================================
%
%>  @file           my_Morlet.m
%
%>  @brief          Genero la ondita morlet a partir de par�metros
%
%>  @paramin        li      L�mite inferior del soporte
%>  @paramin        ls      L�mite superior del soporte
%>  @paramin        N       Cantidad de muestras a generar
%
%>  @author        Roux, Federico G.(rouxfederico@gmail.com)
%>  @company       RT-DSP UTN.BA
%==========================================================================================================================================

function [W t] = my_Morlet(li, ls, N)

t = linspace(li, ls, N);                                                    % Genero espacio lineal entre los l�mites del soporte (eje temporal)
    
W = exp(-(t.^2)/2).*cos(5*t);                                               % Ecuaci�n de la ondita

end