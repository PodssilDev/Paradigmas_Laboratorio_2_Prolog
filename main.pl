% ----------------------------- TDA FECHA-------------------------------------
% Dominio:
% cantidad_dias: Entero
% DD: Entero
% MM: Entero
% AAAA: Entero

%  Precidados:  
% mes(MM, cantidad_dias)
% date(DD, MM, AAAA)
% getDiaFecha([DD,MM,AAAA], DD)
% getMesFecha([DD,MM,AAAA], MM)
% getAnioFecha([DD,MM,AAAA], AAAA)

% ---------------------------REPRESENTACION-----------------------------------
% El TDA Fecha se representa a traves de una lista (integer X integer X
% integer), la cual contiene un dia, un mes y un anio.

% ---------------------------------CONSTRUCTOR Y PERTENENCIA------------------

% Clausulas
% Hechos: 
% Sabemos que existe una cantidad fija de dias por meses
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

% reglas
% Dominio: Tres enteros y una lista de enteros
% Descripcion: Predicado que construyen una fecha valida
date(DD,MM,AAAA,[DD,MM,AAAA]) :-
	integer(DD), integer(MM), integer(AAAA),
	mes(MM,Dias),
	DD>0,
	DD=<Dias.

% ---------------------------------SELECTORES---------------------------------

% Dominio: Una fecha (lista de tres integers) y un entero
% Descripcion: Predicado que obtiene los dias correspondientes a una fecha valida
getDiaFecha([DD,MM,AAAA], DD):-
	date(DD,MM,AAAA,[DD,MM,AAAA]).

% Dominio: Una fecha (lista de tres integers) y un entero
% Descripcion: Predicado que obtiene el mes correspondientes a una fecha valida
getMesFecha([DD,MM,AAAA],MM) :-
	date(DD,MM,AAAA,[DD,MM,AAAA]).

% Dominio: Una fecha (lista de tres integers) y un entero
% Descripcion: Predicado que obtiene el anio correspondientes a una fecha valida
getAnioFecha([DD,MM,AAAA],AAAA) :-
	date(DD,MM,AAAA,[DD,MM,AAAA]).

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

getUserName([Date,Nombre,Password], Nombre):-
	usuario(Date,Nombre,Password,[Date,Nombre,Password]).

getUserPass([Date,Nombre,Password], Password):-
	usuario(Date,Nombre,Password,[Date,Nombre,Password]).

% ...

% TDA User
% TDA Historial
% TDA Permiso
% Paradigmadocs
% TDA Documento

pertenece(NombreU,[[_,NombreU,_]|_]):- !.
pertenece(NombreU,[[_,_,_]|L]):-
            pertenece(NombreU,L).

buscarUsuarioPassword([H|_],Usuario,Password):-
    getUserName(H,Username),
    getUserPass(H,Contrasena),
    (Usuario = Username),
    (Password = Contrasena).
buscarUsuarioPassword([_|T],Usuario,Password):-
    buscarUsuarioPassword(T,Usuario,Password).


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

%
paradigmaDocsLogin(Sn1,Username,Password,Sn2):-
    string(Username),
    string(Password),
    getNombrePdocs(Sn1,NamePdocs),
    getDatePdocs(Sn1, DatePdocs),
    getRegistradosPdocs(Sn1,Users),
    buscarUsuarioPassword(Users,Username,Password),!,
	getActivosPdocs(Sn1,Activo),
    getDocumentosPdocs(Sn1,Documents),
    append(Activo,[Username],NewActivo),
    paradigmadocsActualizado(NamePdocs,DatePdocs,Users,NewActivo,Documents, Sn2).

% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", PD2).

% ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]

% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]).