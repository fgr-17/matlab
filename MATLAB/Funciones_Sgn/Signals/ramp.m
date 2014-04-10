%-------------------------------------------------------------
%Funcion: ramp.m
%Acción: Genera la función rampa: p(x)= x si x>0; 0 x<=0
%Entrada: x-> vector temporal (t) o discreto (n)
%Salida: r-> vector temporal r(t) o discreto r(n)
%-------------------------------------------------------------
function r=ramp(x)
    r=x.*(x>0);
end 