%-------------------------------------------------------------
%Funcion: esc.m
%Acción: Genera la función escalón: u(x)= 1 x>=0; 0 x<0
%Entrada: x-> vector temporal (t) o discreto (n)
%Salida: u-> vector temporal u(t) o discreto u(n)
%-------------------------------------------------------------
function u=esc(x)
u=(x>=0);