% -------------------------LABORATORIO 2: PROLOG-----------------------------

% ----------------------------- TDA DATE-------------------------------------
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

% --------------------------CONSTRUCTOR Y PERTENENCIA-------------------------

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

% ----------------------------- TDA USER-------------------------------------

% Dominio:
% Date: Date
% Nombre: String
% Password: String

% Predicados:
% user(Date,Nombre,Password,[Date,Nombre,Password])
% getUserDate([Date,Nombre,Password], Date)
% getUserName([Date,Nombre,Password], Nombre)
% getUserPass([Date,Nombre,Password], Password)

% ---------------------------REPRESENTACION-----------------------------------

% El TDA User se representa a traves de una lista (date X string X string X list)
% la cual contiene una fecha, un username y un password

% ---------------------------CONSTRUCTOR Y PERTENENCIA---------------------

% Clausulas
% Reglas

% Dominio: Date, String, String y TDA User
% Descripcion: Predicado que crea un User valido
user(Date, Nombre, Password, [Date, Nombre, Password]) :-
	string(Nombre),
	string(Password),
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% ----------------------------SELECTORES---------------------------------

% Dominio: Un User valido y una date
% Descripcion: Predicado que obtiene la fecha de un User
getUserDate([Date,Nombre,Password], Date):-
	user(Date,Nombre,Password,[Date,Nombre,Password]).

% Dominio: Un user valido y un string
% Descripcion: Predicado que obtiene el username de un User
getUserName([Date,Nombre,Password], Nombre):-
	user(Date,Nombre,Password,[Date,Nombre,Password]).

% Dominio: Un user valido y un string
% Descripcion: Predicado que obtiene el password de un User
getUserPass([Date,Nombre,Password], Password):-
	user(Date,Nombre,Password,[Date,Nombre,Password]).
% ------------------------------OTROS PREDICADOS--------------------------


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

% -------------------------TDA HISTORIAL----------------------------------
% Dominio: 
% Date: Date (Lista de 3 integers)
% Contenido: String
% IDVer: Integer

% Predicados:
% historial(Date, Contenido, IDVer, [Date, Contenido, IDVer])

% ---------------------------REPRESENTACION-----------------------------------

% El TDA Historial se representa a traves de una lista (date X string X integer)
% que contiene una fecha, un contenido y un ID 

% ---------------------------CONSTRUCTOR Y PERTENENCIA---------------------

% Clausulas
% Reglas

% Dominio: Date, String, Integer, TDA Historial
% Descripcion: Predicado que crea una version de un Documento.
historial(Date,Contenido,IDVer, [Date, Contenido, IDVer]):-
	string(Contenido),
	integer(IDVer),
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% ----------------------------SELECTORES---------------------------------



% -------------------------TDA DOCUMENTO-------------------------------------

% Dominio:
% Autor: String
% Date: Date
% Nombre: String
% Contenido: String
% IDDoc: Intgeger
% Permisos: List
% HistorialList: List

% Predicados:
% documento(Autor, Date, Nombre, Contenido, IDDoc, DocFinal)
% getAutorDocumento([Autor,_,_,_,_,_,_],Autor)
% getDateDocumento([_,Date,_,_,_,_,_], Date)
% getNameDocumento([_,_,Nombre,_,_,_,_],Nombre)
% getContenidoDocumento([_,_,_,Contenido,_,_,_],Contenido)
% getPermisosDocumento([_,_,_,_,Permisos,_,_],Permisos)
% getHistorialDocumento([_,_,_,_,_,HistorialList,_],HistorialList)
% getIDDocumento([_,_,_,_,_,_,IDDoc],IDDoc)

% ---------------------------REPRESENTACION-----------------------------------

% El TDA Documento se representa a traves de una lista (string X date X string
% X string X list X list X integer) que contiene un Autor, una fecha, un nombre,
% un contenido (texto), dos listas, donde la primera es la lista de permisos y la
% segunda es la lista de historial y un ID unico.

% ---------------------------CONSTRUCTOR Y PERTENENCIA---------------------
%
documento(Autor,Date,Nombre,Contenido, IDDoc, DocFinal):-
	string(Autor),
	string(Nombre),
	string(Contenido),
	integer(IDDoc),
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!,
	historial(Date,Contenido,0, Hist1),
	DocFinal = [Autor,Date,Nombre,Contenido,[],[Hist1],IDDoc].

% ----------------------------SELECTORES---------------------------------

getAutorDocumento([Autor,_,_,_,_,_,_],Autor):-
	string(Autor).

getDateDocumento([_,Date,_,_,_,_,_], Date):-
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

getNameDocumento([_,_,Nombre,_,_,_,_],Nombre):-
	string(Nombre).

getContenidoDocumento([_,_,_,Contenido,_,_,_],Contenido):-
	string(Contenido).

getPermisosDocumento([_,_,_,_,Permisos,_,_],Permisos):-
	is_list(Permisos).

getHistorialDocumento([_,_,_,_,_,HistorialList,_],HistorialList):-
	is_list(HistorialList).

getIDDocumento([_,_,_,_,_,_,IDDoc],IDDoc):-
	integer(IDDoc).


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

getUserActivo([UserAct], UserAct).

% Dominio: Un paradigmaDocs y una lista de documentos
% Descripcion: Predicado que obtiene la lista de documentos de una plataforma de tipo ParadigmaDocs
getDocumentosPdocs([_,_,_,_,Docs], Docs).

paradigmadocsActualizado(Nombre,Fecha,ListRegistrados,ListActivo,ListDocumento,PDOUT):-
	PDOUT = [Nombre, Fecha, ListRegistrados,ListActivo,ListDocumento].


% -------------------------------PREDICADOS OBLIGATORIOS--------------------------------------------

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
	user(Fecha,Username,Password,New),
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

paradigmaDocsCreate(Sn1, Fecha, Nombre, Contenido, Sn2):-
	string(Nombre),
	string(Contenido),
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo,UserActivo),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	getDocumentosPdocs(Sn1,Documents),
	length(Documents,IDDoc),
	documento(UserActivo, Fecha, Nombre, Contenido, IDDoc, Doc),
	append(Documents, [Doc], NewDocuments),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], NewDocuments, Sn2).

%paradigmaDocsShare(Sn1, DocumentId, ListaPermisos, ListaUsernamesPermitidos)
	

% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", PD2).

% ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]

% date(20, 12, 2015, D1), paradigmaDocs("google docs", D1, PD1), paradigmaDocsRegister(PD1, D1, "vflores", "hola123", ["google docs", [20, 12, 2015], [[[20, 12, 2015], "vflores", "hola123"]], [], []]).