
% -------------------------TDA Paradigmadocs----------------------------------
% ---------------------------REPRESENTACION-----------------------------------
% El TDA Paradigmadocs se representa a traves de una lista 
% (string X fecha X list X list X list) la cual contiene un nombre, una fecha y
% tres listas inicialmente vacias donde seran guardados los usuarios registrados, 
% el usuario activo y los documentos.

% ---------------------------------CONSTRUCTOR-------------------------------

% Dominio: Un nombre de tipo string y una fecha
% Recorrido: Una lista

paradigmadocs(Nombre,Fecha,[Nombre,Fecha,[],[],[]]).

% ---------------------------------SELECTORES---------------------------------

getNombre([Nombre|_],Nombre).
getDate([_,Date,_,_,_] Date).

% ----------------------------- TDA USER-------------------------------------
% ---------------------------REPRESENTACION-----------------------------------
% ------------------------------CONSTRUCTOR----------------------------------

usuario(Date, Nombre, Password, [Date, Nombre, Password]).

% ----------------------------- TDA FECHA-------------------------------------
% ---------------------------REPRESENTACION-----------------------------------
% El TDA Fecha se representa a traves de una lista (integer X integer X
% integer), la cual contiene un dia, un mes y un anio.

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

% TDA User
% TDA Historial
% TDA Permiso
% Paradigmadocs
% TDA Documento

pertenece(NombreU,[[NombreU,_,_,_,_]|_]):- !.
pertenece(NombreU,[[_,_,_,_,_]|L]):-
            pertenece(NombreU,L).































