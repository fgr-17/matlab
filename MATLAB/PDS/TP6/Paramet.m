% Función que permite el ingreso de datos para ruido y filtrado de FASE CERO. 
% Permite el ingreso de uno o dos parámetros mas el titulo según el tipo de opción.
%
% MSc Ing. Franco Martin Pessana
% Procesamiento Digital de Señales
% Facultad regional Buenos Aires
% Universidad Tecnológica Nacional
% Ciclo Lectivo 2009

function [V1,V2]=Paramet(Ti,L1,L2)

H_Par=figure(10);
clf;
set(H_Par,'position',[200 150 380 150],'NumberTitle','off','menubar','none',...  % Seteo del area de visualizacion de los graficos
  'name',Ti); 
if nargin<3
  % Rutina para las señales que requieren un argumento de entrada
  uicontrol(H_Par,'style','text','string',L1,'position',[140 100 100 20],...
   'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  C1=uicontrol(H_Par,'style','edit','position',[140 70 100 20],...
       'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  waitfor(C1,'string')
  V1=str2num(get(C1,'string'));
  close(H_Par);
  return
else
  % Rutina para las señales que requieren dos argumentos de entrada
  uicontrol(H_Par,'style','text','string',L1,'position',[60 100 100 20],...
   'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  uicontrol(H_Par,'style','text','string',L2,'position',[220 100 100 20],...
   'backgroundcolor',[0.8 0.8 0.8],'foregroundcolor',[0 0 0],'fontWeight','bold');
  C1=uicontrol(H_Par,'style','edit','position',[60 70 100 20],...
       'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  C2=uicontrol(H_Par,'style','edit','position',[220 70 100 20],...
     'backgroundcolor',[1 1 1],'foregroundcolor',[0 0 0]);
  waitfor(C1,'string')
  V1=str2num(get(C1,'string'));
  waitfor(C2,'string')
  V2=str2num(get(C2,'string'));
  close(H_Par);
  return
end 