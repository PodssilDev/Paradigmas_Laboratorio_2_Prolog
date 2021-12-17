% -------------------------TDA ParadigmaDocs----------------------------------
% ---------------------------REPRESENTACION-----------------------------------

% El TDA Paradigmadocs se representa a traves de una lista 
% (string X fecha X list X list X list) la cual contiene un nombre, una fecha y
% tres listas inicialmente vacias donde seran guardados los usuarios registrados, 
% el usuario activo y los documentos.

% ---------------------------------CONSTRUCTOR-------------------------------

% Dominio: Un nombre de tipo string, una fecha y un TDA ParadigmaDocs
% Descripcion: Predicado que crea una plataforma de tipo paradigmaDocs
paradigmaDocs(Nombre,Fecha,[Nombre,Fecha,[],[],[]]).

% ---------------------------------SELECTORES---------------------------------

% Dominio: Un paradigmaDocs y un nombre de tipo string
% Descripcion: Predicado que obtiene el nombre de una plataforma de tipo ParadigmaDocs
getNombrePdocs([Nombre|_],Nombre).

% Dominio: Un paradigmaDocs y una fecha de tipo date
% Descripcion: Predicado que obtiene la fecha de creacion de una plataforma de tipo ParadigmaDocs

getDatePdocs([_,Date,_,_,_], Date).

% Dominio: Un paradigmaDocs y una lista de usuarios registrados
% Descripcion: Predicado que obtiene la lista de usuarios registrados de una plataforma de tipo ParadigmaDocs
getRegistradosPdocs([_,_,Registrados,_,_],Registrados).

% Dominio: Un paradigmaDocs y una lista de users activos
% Descripcion: Predicado que obtiene la lista de User Activo de una plataforma de tipo ParadigmaDocs
getActivosPdocs([_,_,_,Activos,_], Activos).

% Dominio: Un paradigmaDocs y una lista de documentos
% Descripcion: Predicado que obtiene la lista de documentos de una plataforma de tipo ParadigmaDocs
getDocumentosPdocs([_,_,_,_,Docs], Docs).

paradigmadocsActualizado(Nombre,Fecha,ListRegistrados,ListActivo,ListDocumento,PDOUT):-
	PDOUT = [Nombre, Fecha, ListRegistrados,ListActivo,ListDocumento].
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

date(DD,MM,AAAA,[DD,MM,AAAA]) :-
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

pertenece(NombreU,[[_,NombreU,_]|_]):- !.
pertenece(NombreU,[[_,_,_]|L]):-
            pertenece(NombreU,L).


% Dominio: Fecha, string, string, TDA Paradigmadocs
paradigmaDocsRegister(Sn1, Fecha, Username, Password, Sn2):-
	string(Username),
	string(Password),
	getNombrePdocs(Sn1, NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	getActivosPdocs(Sn1,Activo),
	getDocumentosPdocs(Sn1,Documents),
	not(pertenece(Username, Users)),
	usuario(Fecha,Username,Password,New),
	append(Users,[New],NewRegistrados),
	paradigmadocsActualizado(NamePdocs, DatePdocs, NewRegistrados, Activo, Documents, Sn2).


% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", PD2).

% ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]

% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]).