%----------------------------- TDA FECHA-------------------------------------
% ---------------------------REPRESENTACIÓN----------------------------------
% El TDA Fecha se representa a traves de una lista (integer X integer X
% integer), la cual contiene un dia, un mes y un año.

% ---------------------------------CONSTRUCTOR-------------------------------
% Sabemos que existe una cantidad fija de dias por meses

% Hecho: mes(numero_mes, cantidad_dias)

mes(1,31).
mes(2,28).
mes(2,29).
mes(3,31).
mes(4,30).
mes(5,31).
mes(6,30).
mes(7,31).
mes(8,31).
mes(9,30).
mes(10,31).
mes(11,30).
mes(12,31).

fecha(DD,MM,AAAA,[DD,MM,AAAA]) :-
	integer(DD), integer(MM), integer(AAAA),
	mes(MM,Dias),
	DD>0,
	DD=<Dias.

% ...

































