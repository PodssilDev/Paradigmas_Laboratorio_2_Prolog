/*__________________________________________________________________________________________
  _          _      ____      ____          ____    ____     ___    _        ___     ____ 
 | |        / \    | __ )    |___ \   _    |  _ \  |  _ \   / _ \  | |      / _ \   / ___|
 | |       / _ \   |  _ \      __) | (_)   | |_) | | |_) | | | | | | |     | | | | | |  _ 
 | |___   / ___ \  | |_) |    / __/   _    |  __/  |  _ <  | |_| | | |___  | |_| | | |_| |
 |_____| /_/   \_\ |____/    |_____| (_)   |_|     |_| \_\  \___/  |_____|  \___/   \____|
_____________________________________________________________________________________________*/
% Nombre: John Serrano Carrasco
% Seccion: 13310-A-1
% Profesor de seccion: Roberto Gonzales Ibanez

/*____________________________________________________________________________________________
  _____   ____       _        _____                 _             
 |_   _| |  _ \     / \      |  ___|   ___    ___  | |__     __ _ 
   | |   | | | |   / _ \     | |_     / _ \  / __| | '_ \   / _` |
   | |   | |_| |  / ___ \    |  _|   |  __/ | (__  | | | | | (_| |
   |_|   |____/  /_/   \_\   |_|      \___|  \___| |_| |_|  \__,_|     
_______________________________________________________________________________________________*/

% Dominio:
% Fecha: Fecha
% Dias, DD, MM, AAAA: Enteros
% StrOut: String

%  Precidados:  
% mes(MM, Dias). (aridad = 2)
% date(DD, MM, AAAA) (aridad = 3)
% getDiaFecha(Fecha, DD) (aridad = 2)
% getMesFecha(Fecha, MM) (aridad = 2)
% getAnioFecha(Fecha, AAAA) (aridad = 2)
% fecha_to_string(Fecha, StrOut) (aridad = 2)

% Metas primarias: getDiaFecha, getMesFecha, getAnioFecha y fecha_to_string
% Metas secundarias: mes y date

% ---------------------------REPRESENTACION-------------------------------------------------------

% El TDA Fecha se representa a traves de una lista (integer X integer X integer), la cual contiene
% un dia, un mes y un anio.

% --------------------------CONSTRUCTOR Y PERTENENCIA---------------------------------------------

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

% ---------------------------------SELECTORES---------------------------------------------------

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

% ---------------------------------------OTROS PREDICADOS------------------------------------------

% Dominio: Una fecha (lista de tres integers) y un string
% Descripcion: Predicado que transforma una fecha en un string.
fecha_to_string([DD,MM,AAAA],StrOut):-
    string_concat(DD,"/",S1),
    string_concat(MM,"/",S2),
    string_concat(S1,S2,S3),
    string_concat(S3,AAAA,StrOut).  

/*_______________________________________________________________________________________________
  _____   ____       _        _   _                     
 |_   _| |  _ \     / \      | | | |  ___    ___   _ __ 
   | |   | | | |   / _ \     | | | | / __|  / _ \ | '__|
   | |   | |_| |  / ___ \    | |_| | \__ \ |  __/ | |   
   |_|   |____/  /_/   \_\    \___/  |___/  \___| |_|   
__________________________________________________________________________________________________*/

% Dominio:
% User: User
% Date: Fecha (lista de 3 integers)
% Nombre, Password, StrOut: String
% UserList, UserNameList: List

% Predicados:
% user(Date,Nombre,Password,[Date,Nombre,Password]) (aridad = 4)
% getUserDate(User, Date) (aridad = 2)
% getUserName(User, Nombre) (aridad = 2)
% getUserPass(User,  Password) (aridad = 2)
% pertenece(Nombre,UserList) (aridad = 2)
% buscarUsuarioPassword(UserList, Usuario, Password) (aridad = 2)
% verificarListaUsuarios(UsersList, UserNameList) (aridad = 2)
% obtenerDatosUser(UserList, Nombre, User) (aridad = 3)
% userToString(User, StrOut) (aridad = 2)

% Metas primarias: buscarUsuarioPassword, verificarListaUsuarios, obtenerDatosUser, userToString
% Metas secundarias: Todos los selectores del TDA Fecha, user, getUserDate, getUserName, getUserPass
% pertenece.

% -------------------------------------REPRESENTACION----------------------------------------------

% El TDA User se representa a traves de una lista (date X string X string X list) cual contiene una
% fecha, un username y un password

% -------------------------------CONSTRUCTOR Y PERTENENCIA-----------------------------------------

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

% --------------------------------------SELECTORES--------------------------------------------------

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

% ---------------------------------------OTROS PREDICADOS------------------------------------------

% Dominio: Un Nombre (string) y un UserList
% Descripcion: Caso base de pertenece. Si el nombre es igual al nombre del User
% entonces el predicado da true.
pertenece(Nombre,[[_,Nombre,_]|_]):- !.
pertenece(Nombre,[[_,_,_]|OtherUsers]):-
            pertenece(Nombre,OtherUsers).

% Dominio: Una lista de users, un username (string) y un password (string)
% Descripcion: Verifica si existe un User en la lista de Users tal que el username y
% password coincidan con los ingresados por entrada
buscarUsuarioPassword([UserActual|_],Usuario,Password):-
    getUserName(UserActual,Username),
    getUserPass(UserActual,Contrasena),
    (Usuario = Username),
    (Password = Contrasena).
buscarUsuarioPassword([_|OtherUsers],Usuario,Password):-
    buscarUsuarioPassword(OtherUsers,Usuario,Password).

% Dominio: Una lista de Usuarios registrados y una lista de usernames
% Descripcion: Predicado que verifica si todos los usernames de una lista pertenecen a los usernames
% de usuarios en otra lista (En este caso, en la lista de registrados de paradigmaDocs)
verificarListaUsuarios(_, []):- !.
verificarListaUsuarios(UsersRegistrados, [UserNameActual|OtherUserNames]):-
	pertenece(UserNameActual, UsersRegistrados),
	verificarListaUsuarios(UsersRegistrados,OtherUserNames).

% Dominio: Una lista de usuarios, un username y un user
% Descripcion: Predicado que revisa si un User esta en una lista de usuarios y si es asi, 
% obtiene los datos de este.
obtenerDatosUser([UserActual|_], User, DatosUser):-
	getUserName(UserActual, Username),
	(User == Username),
	DatosUser = UserActual.
obtenerDatosUser([_|RestoUsers], User, DatosUser):-
	obtenerDatosUser(RestoUsers, User, DatosUser).

% Dominio: Un user y un string
% Descripcion: Predicado que transforma todos los datos de un User a un solo string
userToString(User, StrOut):-
	getUserName(User, Name),
	getUserDate(User, Date),
	getUserPass(User, Password),
	fecha_to_string(Date, DateString),
	string_concat("---------- \nUsername: ", Name, S1),
	string_concat(S1, "\nPassword: ", S2),
	string_concat(S2, Password, S3),
	string_concat(S3, "\nFecha de registro: ", S4),
	string_concat(S4, DateString, S5),
	string_concat(S5, "\n----------\n", StrOut).

/*__________________________________________________________________________________________________
  _____   ____       _        _   _   _         _                    _           _ 
 |_   _| |  _ \     / \      | | | | (_)  ___  | |_    ___    _ __  (_)   __ _  | |
   | |   | | | |   / _ \     | |_| | | | / __| | __|  / _ \  | '__| | |  / _` | | |
   | |   | |_| |  / ___ \    |  _  | | | \__ \ | |_  | (_) | | |    | | | (_| | | |
   |_|   |____/  /_/   \_\   |_| |_| |_| |___/  \__|  \___/  |_|    |_|  \__,_| |_|
____________________________________________________________________________________________________*/
                                                                                 
% Dominio: 
% Historial: Historial
% Date: Fecha (Lista de 3 integers)
% Contenido, StrOut, SearchText: String
% IDVer: Integer
% ContentList: List

% Predicados:
% historial(Date, Contenido, IDVer, [Date, Contenido, IDVer]) (aridad = 3)
% getDateHistorial(Historial, Date) (aridad = 2)
% getTextoHistorial(Historial, Contenido) (aridad = 2)
% getIDHistorial(Historial, IDVer) (aridad = 2)
% historialToString(Historial, StrOut) (aridad = 2)
% searchInHistorial(ContentList, SearchText) (aridad = 2)

% Metas primarias: historial, historialToString, searchInHistorial
% Metas secundarias: getDateHistorial, getTextoHistorial, getIDHistorial

% ---------------------------------------REPRESENTACION-----------------------------------------------

% El TDA Historial se representa a traves de una lista (date X string X integer) que contiene una 
% fecha, un contenido y un ID 

% ------------------------------------CONSTRUCTOR Y PERTENENCIA----------------------------------------

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

% ---------------------------------------------SELECTORES----------------------------------------------

% Dominio: Una version de historial y una fecha
% Descripcion: Predicado que obtiene una fecha valida de una version de historial
getDateHistorial([Date,_,_], Date):-
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% Dominio: Una version de historial y un texto (string)
% Descripcion: Predicado que obtiene el texto de una version de historial
getTextoHistorial([_,Contenido,_], Contenido):-
	string(Contenido).

% Dominio: Una version de historial y un ID (integer)
% Descripcion: Predicado que obtiene el ID de una version de historial.
getIDHistorial([_,_,IDVer], IDVer):-
	integer(IDVer).

% -------------------------------------OTROS PREDICADOS-----------------------------------------------

% Dominio: Una version de Historial y un string
% Descripcion: Predicado que transforma el contenido de una version de historial en un string
historialToString(Historial, StrOut):-
	getDateHistorial(Historial, Date),
	getTextoHistorial(Historial, Contenido),
	getIDHistorial(Historial,IDVer),
	string_concat("Version Numero ", IDVer, S1),
	string_concat(S1, ": * ", S2),
	string_concat(S2, Contenido, S3),
	string_concat(S3, " * ", S4),
	string_concat(S4, "version guardada en la fecha: ", S5),
	fecha_to_string(Date, DateString),
	string_concat(S5, DateString, S6),
	string_concat(S6, '\n', StrOut).

% Dominio: Una lista de contenidos de versiones de historial y un texto (string)
% Descripcion: Predicado que verifica si un texto se encuentra en alguna de las versiones de historial
searchInHistorial([PrimerContenido|_], SearchText):-
	sub_string(PrimerContenido, _, _, _, SearchText).
searchInHistorial([_|RestoContenido], SearchText):-
	searchInHistorial(RestoContenido, SearchText).

/*______________________________________________________________________________________________________
  _____   ____       _        ____                                                      _           
 |_   _| |  _ \     / \      |  _ \    ___     ___   _   _   _ __ ___     ___   _ __   | |_    ___  
   | |   | | | |   / _ \     | | | |  / _ \   / __| | | | | | '_ ` _ \   / _ \ | '_ \  | __|  / _ \ 
   | |   | |_| |  / ___ \    | |_| | | (_) | | (__  | |_| | | | | | | | |  __/ | | | | | |_  | (_) |
   |_|   |____/  /_/   \_\   |____/   \___/   \___|  \__,_| |_| |_| |_|  \___| |_| |_|  \__|  \___/ 
_________________________________________________________________________________________________________*/                                                                                                   
% Dominio:
% Autor, Nombre, Contenido, Permiso, SearchText, StrOut,Text1, Text2, TextFinal, StrTemp, StrDocument,
% Username, User: String
% Date: Fecha
% IDDoc, : Intgeger
% Permisos, HistorialList, ListElementos, ListPermisos, Permiso, ListTemp, ListUsername, ListUsers, 
% ListDocuments, ListFinal, ListPermisosPre, Accceses, ListDocumentos, ListIDs, ListGuardado, 
% DocumentsFinal, DocsTextFound, DocsHistTextFound, AccesesFinal DocsFinal,: List
% Retorno: Documento
% Cabeza, Elemento: Cualquier tipo
% UserActivo: User

% Predicados:
% documento(Autor, Date, Nombre, Contenido, IDDoc, DocFinal) (aridad = 6)
% getAutorDocumento(Documento,Autor) (aridad = 2)
% getDateDocumento(Documento, Date) (aridad = 2)
% getNameDocumento(Documento,Nombre) (aridad = 2)
% getContenidoDocumento(Documento,Contenido) (aridad = 2)
% getPermisosDocumento(Documento, Permisos) (aridad = 2)
% getHistorialDocumento(Documento,HistorialList) (aridad = 2)
% getIDDocumento(Documento,IDDoc) (aridad = 2)
% encontrarPorIDDocumento(Documento,IDoc,Retorno) (aridad = 3)
% primerElemento(ListElementos, Cabeza) (aridad = 2)
% permisoValido(Permiso) (aridad = 1)
% buscarPermiso(Permisos,User,ListPermisos) (aridad = 3)
% verificarCompartir(Permisos) (aridad = 1)
% puedeCompartir(ListPermiso,UserActivo) (aridad = 2)
% verificarEditar(ListPermiso) (aridad = 1)
% puedeEditar(ListPermiso,UserActivo) (aridad = 2)
% verificarPermisosValidos(ListPermiso) (aridad = 1)
% obtenerListaAccesos(ListaPermisos,ListUsernames, ListaPermisosPre, ListaResultante) (aridad = 4)
% tienePoder(ListPermisos, User, ListaTemp, ListaResultante) (aridad = 4)
% tienenPermisos(ListaPermisos,ListUsers, ListGuardado, ListResultado) (aridad = 4)
% borrarPrimeraOcurrenciaPermiso(Elemento, ListPermisos, Resultado ) (aridad = 4)
% borrarRepetidos(Accesses, ListUsernames, AccessesFinal) (aridad = 3)
% borrarDocDuplicado(Documento, ListDocumentos, ListResultado) (aridad = 3)
% encontrarPorIDHistorial(ListHistorial, IDVersion, Retorno) (aridad = 3)
% elementoPermisoString(Elemento,StrOut) (aridad = 2)
% permisosToString(ListPermisos, StrTemp, StrOutP) (aridad = 3)
% fullAccessesToString(ListPermisos, StrTemp, StrOut)  (aridad = 3)
% documentoToString(Documento, StrDocument) (aridad = 2)
% puedeAcceder(ListPermisos,User) (aridad = 2)
% obtenerDocsAcceso(ListDocumentos, User, ListTemp, ListFinal) (aridad = 4)
% searchInDocuments(ListDocumentos, SearchText, TempList, DocsTextFound) (aridad = 4)
% searchInDocsHist(LiatDocumentos, SearchText, TempList, DocsHistTextFound) (aridad = 4)
% unirBusquedas(DocsTextFound, ListDocumentos, DocsFinal) (aridad =  3)
% reemplazarPalabras(TextoOriginal, Text1, Text2, ListTemp, TextFinal) (aridad = 5)
% eliminarTodosLosPermisos(Document, NewDocument) (aridad = 2)
% obtenerDocumentosPropios(ListIDs, Documents, UserActivo, TempList, ListFinal) (aridad = 5)
% eliminarDocsDuplicados(ListDocuments, Documents, DocumentsFinal) (aridad = 3)
% agregarNuevosDocs(ListDocuments, Documents,  DocumentsFinal) (aridad = 3)
% obtenerDocumentosPorAutor(ListDocuments, User, TempList, ListFinal) (aridad = 4)

% Metas primarias: documento, puedeCompartir, puedeEditar, verificarPermisosValidos, obtenerListaAccesos
% tienen permisos, borrar repetidos, encontrarPorIDHistorial, documentoToString, obtenerDocsAcceso, 
% searchInDocuments, searchInDocsHist, unirBusquedas, reemplazarPalabras, eliminarTodosLosPermisos, 
% obtenerDocumentosPropios, eliminarDocsDuplicados, agregarNuevosDocs, obtenerDocumentosPorAutor.

% Metas secundarias: getAutorDocumento, getDateDocumento, getNameDocumento, getContenidoDocumento,
% getPermisosDocumento, getHistorialDocumento, getIDDocumento, encontrarPorIDDocumento, primerElemento,
% permisoValido, buscarPermiso, verificarCompartir, verificarEditar, tienePoder,
% borrarPrimeraOcurrenciaPermiso, borrarDocDuplicado, elementoPermisoString, permisosToString,
% fullAccessesToString, puedeAcceder,

% -------------------------------------REPRESENTACION--------------------------------------------------

% El TDA Documento se representa a traves de una lista (string X date X string X string X list X list X 
% integer) que contiene un Autor, una fecha, un nombre, un contenido (texto), dos listas, donde la 
% primera es la lista de permisos y la segunda es la lista de historial y un ID unico.

% ---------------------------------CONSTRUCTOR Y PERTENENCIA-------------------------------------------

% Dominio: Tres strings, una fecha, un integer y un TDA Documento
% Descripcion: Predicado que crea un Documento.
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
	historial(Date,Contenido,0, HistorialList),
	DocFinal = [Autor,Date,Nombre,Contenido,[[Autor, "R", "W", "C", "S"]],[HistorialList],IDDoc].

% ---------------------------------------SELECTORES----------------------------------------------------

% Dominio: Un Documento y un string
% Descripcion: Predicado que obtiene al Autor de un Documento
getAutorDocumento([Autor,_,_,_,_,_,_],Autor):-
	string(Autor).

% Dominio: Un Documento y una date
% Descripcion: Predicado que obtiene la fecha de creacion de un Documento
getDateDocumento([_,Date,_,_,_,_,_], Date):-
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% Dominio: Un Documento y un string
% Descripcion: Predicado que obtiene el nombre de un Documento
getNameDocumento([_,_,Nombre,_,_,_,_],Nombre):-
	string(Nombre).

% Dominio: Un Documento y un string
% Descripcion: Predicado que obtiene el contenido (texto) de un Documento
getContenidoDocumento([_,_,_,Contenido,_,_,_],Contenido):-
	string(Contenido).

% Dominio: Un Documento y una lista de permisos (lista de sublistas de strings)
% Descripcion: Predicado que la lista de Permisos de un Documento
getPermisosDocumento([_,_,_,_,Permisos,_,_],Permisos):-
	is_list(Permisos).

% Dominio: Un Documento y un Historial
% Descripcion: Predicado que el Historial de un Documento
getHistorialDocumento([_,_,_,_,_,HistorialList,_],HistorialList):-
	is_list(HistorialList).

% Dominio: Un Documento y un integer
% Descripcion: Predicado que el ID unico de un Documento
getIDDocumento([_,_,_,_,_,_,IDDoc],IDDoc):-
	integer(IDDoc).

% -------------------------------------OTROS PREDICADOS-----------------------------------------------

% Dominio: Una lista de Documentos, un ID (integer) y un TDA Documento
% Descripcion: Predicado que encuentra a un Documento en una lista de Documentos a traves de su ID
encontrarPorIDDocumento([PrimerDocumento|_],IDoc,Retorno):-
    getIDDocumento(PrimerDocumento,IDoc2),
    (IDoc2 == IDoc),
    PrimerDocumento = Retorno.
encontrarPorIDDocumento([_|RestoDocumentos],IDoc,Retorno):-
    encontrarPorIDDocumento(RestoDocumentos,IDoc,Retorno).

% HECHO (El unico entre muchas reglas)
% Dominio: Una lista y un elemento (puede ser de cualquier tipo)
% Descripcion: Predicado que obtiene el primer elemento de una lista
primerElemento([Cabeza|_], Cabeza).

% Dominio: Un string
% Descripcion: Predicado que retorna True si un permiso es valido (Si es "R", "W", "S" o "C")
permisoValido(Permiso):-
	(Permiso = "R"), !;
	(Permiso = "W"), !;
	(Permiso = "S"), !;
	(Permiso = "C").

% Dominio: Una lista de sublistas de Permisos de un Documento, un User y una lista de permisos
% Descripcion: Predicado que obtiene (si es que existe) la lista de permisos de un User en especifico
% en un Documento
buscarPermiso([PermisosActual|_],User,ListPermisos):-
    primerElemento(PermisosActual,Username),
    (User = Username),
	ListPermisos = PermisosActual.
buscarPermiso([_|RestoPermisos],User,ListPermisos):-
    buscarPermiso(RestoPermisos,User,ListPermisos).

% Dominio: Una lista que contiene un username y permisos (strings)
% Descripcion: Predicado que verifica si en la lista de permisos se encuentra el permiso de compartir ("S")
verificarCompartir([PrimerPermiso|_]):-
	PrimerPermiso = "S".
verificarCompartir([_|RestoPermisos]):-
	verificarCompartir(RestoPermisos).

% Dominio: Una lista de sublistas de permisos y un User
% Descripcion: Predicado que recorre toda la lista de sublistas de permisos para verificar si un User tiene
% el permiso de compartir ("S")
puedeCompartir(ListPermiso,UserActivo) :-
	buscarPermiso(ListPermiso, UserActivo, PermisosUser),
	verificarCompartir(PermisosUser), !.

% Dominio: Una lista que contiene un username y permisos (strings)
% Descripcion: Predicado que verifica si en la lista de permisos se encuentra el permiso de escritura ("W")
verificarEditar([PrimerPermiso|_]):-
	PrimerPermiso = "W".
verificarEditar([_|RestoPermisos]):-
	verificarEditar(RestoPermisos).

% Dominio: Una lista de sublistas de permisos y un User
% Descripcion: Predicado que recorre toda la lista de sublistas de permisos para verificar si un User tiene
% el permiso de compartir ("W")
puedeEditar(ListPermiso,UserActivo):-
	buscarPermiso(ListPermiso, UserActivo, PermisosUser),
	verificarEditar(PermisosUser), !.

% Dominio: Una lista de solo permisos (strings)
% Descripcion: Predicado que verifica si una lista de solo permisos tiene solo permisos validos
verificarPermisosValidos([]).
verificarPermisosValidos([PrimerPermiso|RestoPermisos]):-
	permisoValido(PrimerPermiso),
	verificarPermisosValidos(RestoPermisos).

% Dominio: Una lista de permisos, una lista de usernames, una lista de permisos de un documento y una lista
% total de permisos, sin filtrar (pueden haber reptidos)
% Descripcion: Predicado que asigna todos los permisos validos a los usuarios correspondientes y coloca estas
% listas en la lista de permisos final del documento, aunque no se filtra, por lo que pueden haber duplicados
% (El proceso de filtrado se hace en otro predicado)
obtenerListaAccesos(_,[],PermisosFinal,ListaResultante):-
    ( PermisosFinal = ListaResultante).
obtenerListaAccesos(ListaPermisos,[PrimerUserN|RestoUserN], ListaPermisosPre, ListaResultante):-
	append([PrimerUserN],ListaPermisos,ListaAcceses),
	append(ListaPermisosPre,[ListaAcceses],NewPermisosPre),
	obtenerListaAccesos(ListaPermisos, RestoUserN, NewPermisosPre, ListaResultante).

% Dominio: Una lista de permisos, Un User y dos listas de users
% Descripcion: Verifica si un User de la lista de usernames permitidos ya tiene permisos en un Documento
tienePoder([],_,ListaTemp,ListaResultante):-
	(ListaTemp = ListaResultante).
tienePoder([PrimeraListaPermisos|_], User, ListaTemp, ListaResultante):-
	primerElemento(PrimeraListaPermisos, Nombre),
	(User == Nombre),
	append([User], ListaTemp, ListaResultante).
tienePoder([_|RestoListaPermisos], User, ListaTemp, ListaResultante):-
	tienePoder(RestoListaPermisos, User, ListaTemp, ListaResultante).

% Dominio: Una lista de permisos y tres listas de users
% Descripcion: Predicado que verifica cuales son los users que ya tienen permisos en un documento y si
% estos corresponden a algunos de los users de la lista de usernames permitidos
tienenPermisos(_,[],ListGuardado,ListResultado):-
	(ListGuardado = ListResultado).
tienenPermisos(ListaPermisos, [PrimerUser|RestoUsers], ListGuardado, ListResultado):-
	tienePoder(ListaPermisos, PrimerUser, ListGuardado, ListTemp),
	tienenPermisos(ListaPermisos,RestoUsers,ListTemp,ListResultado).

% Dominio: Un username, una lista de permisos sin filtrar y una lista de permisos filtradas
% Descripcion: Predicado que elimina una lista de permisos duplicadas de un usuario. El predicado siempre
% elimina los permisos antiguos y deja los nuevos, o elimina los duplicados en caso de que los permisos sean
% iguales a los que ya tenia.
borrarPrimeraOcurrenciaPermiso(Elemento, [PrimeraListaPermisos|RestoListaPermisos], RestoListaPermisos ):-
    primerElemento(PrimeraListaPermisos,Nombre),
    (Elemento == Nombre).
borrarPrimeraOcurrenciaPermiso( Elemento, [PrimeraListaPermisos|RestoListaPermisos], [PrimeraListaPermisos|Resultado] ) :-
	Elemento\=PrimeraListaPermisos,
	borrarPrimeraOcurrenciaPermiso( Elemento, RestoListaPermisos, Resultado ).

% Dominio: Una lista de permisos sin filtrar, una lista de usernames y una lista de permisos filtradas
% Descripcion: Predicado que filtra la lista de permisos de un documento, eliminando aquellos permisos
% repetidos y evitando que un mismo user tenga mas de una lista de permisos
borrarRepetidos(Accesses, [], AcccessesFinal):-
	(Accesses = AcccessesFinal).
borrarRepetidos(Accesses, [PrimerUserN|RestoUserN], AccessesFinal):-
	borrarPrimeraOcurrenciaPermiso(PrimerUserN, Accesses, AccessesTemp),
	borrarRepetidos(AccessesTemp, RestoUserN, AccessesFinal).

% Dominio: Un documento, una lista de documentos y una lista de documentos filtrada
% Descripcion: Predicado que elimina a un documento que va a ser reemplazado por una version actualizada
% de este, evitando asi que hayan dos documentos con el mismo ID.
borrarDocDuplicado( Documento, [PrimerDocumento|RestoDocumentos], RestoDocumentos):-
    (Documento == PrimerDocumento).
borrarDocDuplicado( Documento, [PrimerDocumento|RestoDocumentos], [PrimerDocumento|ListResultado]):-
	Documento\=PrimerDocumento,
	borrarDocDuplicado( Documento, RestoDocumentos, ListResultado).

% Dominio: Un Historial de un documento, un ID (integer) y una version de un documento
% Descripcion: Predicado que encuentra una version del historial de versiones de un documento, a traves
% de su ID.
encontrarPorIDHistorial([PrimeraVersion|_],IDVersion,Retorno):-
    getIDHistorial(PrimeraVersion,ID2),
    (ID2 == IDVersion),
    PrimeraVersion = Retorno.
encontrarPorIDHistorial([_|RestoVersiones],IDVersion,Retorno):-
    encontrarPorIDHistorial(RestoVersiones,IDVersion,Retorno).

% Dominio: Dos strings
% Descripcion: Predicado que retorna un mensaje que varia dependiendo del primer elemento
elementoPermisoString(ElementoC,StrOutEP):-
	(ElementoC == "C"),
	(StrOutEP = " tiene permisos de comentarios -").
elementoPermisoString(ElementoS,StrOutEP):-
	(ElementoS == "S"),
	(StrOutEP = "  tiene permisos de compartir -").
elementoPermisoString(ElementoW,StrOutEP):-
	(ElementoW == "W"),
	(StrOutEP = " tiene permisos de escritura -").
elementoPermisoString(ElementoR,StrOutEP):-
	(ElementoR == "R"),
	(StrOutEP = " tiene permisos de lectura -").
elementoPermisoString(Elemento,StrOutEP):-
	string_concat(Elemento, ":", StrOutEp1),
	(StrOutEP = StrOutEp1).

% Dominio: Una Lista de permisos de un documento, y dos strings
% Descripcion Predicado que transforma toda una lista de permisos a string
permisosToString([], StrTemp, StrOut):-
	(StrTemp = StrOut).
permisosToString([PrimerElemento|RestoElementos], StrTemp, StrOutP):-
	elementoPermisoString(PrimerElemento, Str1),
	string_concat(StrTemp, Str1, Str2),
	permisosToString(RestoElementos, Str2, StrOutP).

% Dominio: Una lista de permisos y dos strings
% Descripcion: Predicado que transforma todo una lista de sublistas de permisos a string
fullAccessesToString([], StrTemp, StrOut):-
	(StrTemp = StrOut).
fullAccessesToString([PrimeraListaPermisos|RestoListaPermisos], StrTemp, StrOut):-
	permisosToString(PrimeraListaPermisos, "", StrOnePermiso),
	string_concat(StrTemp, StrOnePermiso, StrTemp2),
	string_concat(StrTemp2, '\n', StrTemp3),
	fullAccessesToString(RestoListaPermisos, StrTemp3, StrOut).

% Dominio: Un documento y un string
% Descripcion: Predicado que transforma TODO lo que corresponde a un Documento a string
documentoToString(Documento, StrDocument):-
	string_concat("----------",'\n', S1),
	string_concat(S1, "ID de Documento: ", S2),
	getIDDocumento(Documento, IDDoc),
	string_concat(S2, IDDoc, S3),
	string_concat(S3, '\n', S4),
	string_concat(S4, "Autor: ", S5),
	getAutorDocumento(Documento, AutorDoc),
	string_concat(S5, AutorDoc, S6),
	string_concat(S6, '\n', S7),
	string_concat(S7, "Fecha de creacion: ", S8),
	getDateDocumento(Documento, DateDoc),
	fecha_to_string(DateDoc, StringDate),
	string_concat(S8, StringDate, S9),
	string_concat(S9, '\n', S10),
	string_concat(S10, "Contenido (Version actual) del Documento: ", S11),
	getContenidoDocumento(Documento, VersionActual),
	string_concat(S11, VersionActual, S12),
	string_concat(S12, '\n', S13),
	string_concat(S13, "Permisos: \n", S14),
	getPermisosDocumento(Documento, Accesses),
	fullAccessesToString(Accesses, "", AccessesString),
	string_concat(S14, AccessesString, S15),
	string_concat(S15, "Historial de Versiones: \n", S16),
	getHistorialDocumento(Documento, HistorialDoc),
	maplist(historialToString, HistorialDoc, HistorialString),
	atomics_to_string(HistorialString, HistorialStringFull),
	string_concat(S16, HistorialStringFull, S17),
	string_concat(S17, "----------\n", StrDocument).

% Dominio: Una lista de permisos y un string
% Descripcion: Predicado que permite saber si un username tiene algun permiso
puedeAcceder([PrimeraListaPermisos|_],User):-
	primerElemento(PrimeraListaPermisos, FirstName),
	(User == FirstName).
puedeAcceder([_|RestoListaPermisos], User):-
	puedeAcceder(RestoListaPermisos, User).

% Dominio: Una lista de documentos, un username, y dos listas
% Descripcion: Predicado que permite obtener todos los documentos donde un user en especifico
% tenga algun permiso (independiente de que permiso sea).
obtenerDocsAcceso([], _, ListTemp, ListFinal):-
	(ListFinal = ListTemp).
obtenerDocsAcceso([FirstDocument|RestoDocuments], User, ListTemp, ListFinal):-
	getPermisosDocumento(FirstDocument, Permisos),
	puedeAcceder(Permisos, User),
	append(ListTemp, [FirstDocument], ListaTemp2),
	obtenerDocsAcceso(RestoDocuments, User, ListaTemp2, ListFinal).
obtenerDocsAcceso([_|RestoDocuments], User, ListTemp, ListFinal):-
	obtenerDocsAcceso(RestoDocuments, User, ListTemp, ListFinal).

% Dominio: Una lista de textos, dos strings y una lista
% Descripcion: Predicado que verifica si un texto en especifico se encuentra en un texto
% de un documento y si es asi, agrega el contenido a una lista. Obtiene todas los textos
% donde coincida la busqueda.
searchInDocuments([],_, TempList, DocsTextFound):-
	TempList = DocsTextFound, !.
searchInDocuments([PrimerContenido| RestoContenido], SearchText, TempList, DocsTextFound):-
	sub_string(PrimerContenido, _, _, _, SearchText),
	append(TempList, [PrimerContenido], NewTempList),
	searchInDocuments(RestoContenido, SearchText, NewTempList, DocsTextFound).
searchInDocuments([_|RestoContenido], SearchText, TempList, DocsTextFound):-
	searchInDocuments(RestoContenido, SearchText, TempList, DocsTextFound).

% Dominio: Una lista de documentos, un string y dos listas
% Descripcion: Predicado que obtiene todos los documentos donde los historiales, en alguna
% de sus versiones contengan un texto en especifico.
searchInDocsHist([], _, TempList, DocsHistTextFound):-
	TempList = DocsHistTextFound, !.
searchInDocsHist([PrimerDocumento|RestoDocumentos], SearchText, TempList, DocsHistTextFound):-
	getHistorialDocumento(PrimerDocumento, HistList),
	maplist(getTextoHistorial, HistList, TextHist),
	searchInHistorial(TextHist, SearchText),
	append(TempList, [PrimerDocumento], NewTempList),
	searchInDocsHist(RestoDocumentos, SearchText, NewTempList, DocsHistTextFound).
searchInDocsHist([_|RestoDocumentos], SearchText, TempList, DocsHistTextFound):-
	searchInDocsHist(RestoDocumentos, SearchText, TempList, DocsHistTextFound).

% Dominio: Tres listas de documentos
% Descripcion: Predicado que une las listas de documentos donde se encontro los textos
% buscados
unirBusquedas(DocsTextFound, [],DocsFinal):-
	DocsTextFound = DocsFinal, !.
unirBusquedas(DocsTextFound, [PrimerDocumento| RestoDocumentos], DocsFinal):-
	not(member(PrimerDocumento, DocsTextFound)),
	append(DocsTextFound, [PrimerDocumento], NewDocsList),
	unirBusquedas(NewDocsList, RestoDocumentos, DocsFinal).
unirBusquedas(DocsTextFound, [_|RestoDocumentos], DocsFinal):-
	unirBusquedas(DocsTextFound, RestoDocumentos, DocsFinal).

% Dominio: Cuatro strings y una lista 
% Descripcion: Predicado que reemplazando todas las coincidencias de una palabra por otra. Para ello,
% guarda en una lista la palabra cada vez que se le cambia algo, para asi verificar si aun quedan
% caracteres por cambiar
reemplazarPalabras(TextoOriginal, Text1, Text2, ListTemp, TextFinal):-
	not(member(TextoOriginal, ListTemp)),
	append(ListTemp, [TextoOriginal], NewListTemp),
	re_replace(Text1, Text2, TextoOriginal, NewTextoOriginal),
	reemplazarPalabras(NewTextoOriginal, Text1, Text2, NewListTemp, TextFinal), !.
reemplazarPalabras(TextoOriginal, _,_,_,TextFinal):-
	TextoOriginal = TextFinal, !.

% Dominio: Dos documentos, el primero puede tener permisos de otros usuarios
% Descripcion: Predicado que elimina todos los permisos (excepto los del Autor) de un documento.
eliminarTodosLosPermisos(Document, NewDocument):-
	getAutorDocumento(Document, AutorDoc),
	getDateDocumento(Document, DateDoc),
	getNameDocumento(Document, NameDoc),
	getContenidoDocumento(Document, TextDoc),
	getHistorialDocumento(Document, HistorialDoc),
	getIDDocumento(Document, IDDoc),
	NewDocument = [AutorDoc, DateDoc, NameDoc, TextDoc, [[AutorDoc, "R", "W", "C", "S"]], HistorialDoc, IDDoc].

% Dominio: Una lista de IDs, una lista de documentos, un unstring y dos lista de documentos
% Descripcion: Predicado que obtiene todos los documentos propios de un autor en especifico de
% acuerdo a una lista de IDs.
obtenerDocumentosPropios([], _,_,TempList, ListFinal):-
	TempList = ListFinal.
obtenerDocumentosPropios([PrimerID|RestoIDs], Documents, UserActivo, TempList, ListFinal):-
	encontrarPorIDDocumento(Documents, PrimerID, DocumentEncontrado),
	getAutorDocumento(DocumentEncontrado, AutorDoc),
	AutorDoc == UserActivo,
	append(TempList, [DocumentEncontrado], NewTempList),
	obtenerDocumentosPropios(RestoIDs, Documents, UserActivo, NewTempList, ListFinal).
obtenerDocumentosPropios([_|RestoIDs], Documents, UserActivo, TempList, ListFinal):-
	obtenerDocumentosPropios(RestoIDs, Documents, UserActivo, TempList, ListFinal).

% Dominio: Tres listas de documentos
% Descripcion: Predicado que elimina ciertos documentos de otra lista de documentos
eliminarDocsDuplicados([], Documents,  DocumentsFinal):-
	Documents = DocumentsFinal.
eliminarDocsDuplicados([PrimerDocumento|RestoDocumentos], Documents,  DocumentsFinal):-
	borrarDocDuplicado(PrimerDocumento, Documents, NewDocuments),
	eliminarDocsDuplicados(RestoDocumentos, NewDocuments, DocumentsFinal).
eliminarDocsDuplicados([_|RestoDocumentos], Documents,  DocumentsFinal):-
	eliminarDocsDuplicados(RestoDocumentos, Documents,  DocumentsFinal).

% Dominio: Tres listas de documento
% Descripcion: Predicado que agrega ciertos documentos a otra lista de documentos
agregarNuevosDocs([], Documents,  DocumentsFinal):-
	Documents = DocumentsFinal.
agregarNuevosDocs([PrimerDocumento|RestoDocumentos], Documents,  DocumentsFinal):-
	append(Documents, [PrimerDocumento], NewDocuments),
	agregarNuevosDocs(RestoDocumentos, NewDocuments, DocumentsFinal).
agregarNuevosDocs([_|RestoDocumentos], Documents,  DocumentsFinal):-
	agregarNuevosDocs(RestoDocumentos, Documents,  DocumentsFinal).

% Dominio: Una lista de documentos, un username y dos listas
% Descripcion: Predicado que obtiene todos los documentos de un Autor en especifico.
obtenerDocumentosPorAutor([], _, TempList, ListFinal):-
	TempList = ListFinal.
obtenerDocumentosPorAutor([PrimerDocumento|RestoDocumentos], User, TempList, ListFinal):-
	getAutorDocumento(PrimerDocumento, AutorDoc),
	AutorDoc == User,
	append(TempList, [PrimerDocumento], NewTempList),
	obtenerDocumentosPorAutor(RestoDocumentos, User, NewTempList, ListFinal).
obtenerDocumentosPorAutor([_|RestoDocumentos], User, TempList, ListFinal):-
	obtenerDocumentosPorAutor(RestoDocumentos, User, TempList, ListFinal).

/*____________________________________________________________________________________________________________
 _____  ____      _     ____                          _  _                            ____                       
|_   _||  _ \    / \   |  _ \   __ _  _ __   __ _   __| |(_)  __ _  _ __ ___    __ _  |  _ \   ___    ___  ___ 
  | |  | | | |  / _ \  | |_) | / _` || '__| / _` | / _` || | / _` || '_ ` _ \  / _` | | | | | / _ \  / __|/ __|
  | |  | |_| | / ___ \ |  __/ | (_| || |   | (_| || (_| || || (_| || | | | | || (_| | | |_| || (_) || (__ \__ \
  |_|  |____/ /_/   \_\|_|     \__,_||_|    \__,_| \__,_||_| \__, ||_| |_| |_| \__,_| |____/  \___/  \___||___
______________________________________________________________________________________________________________*/
% Dominio:
% Nombre: String
% Date: Fecha
% Registrados, Activos, Documents, ListRegistrados, ListActivo, ListDocumentos: List
% UserActivo: User

% Predicados:
% paradigmaDocs(Nombre,Date,ParadigmaDocs) (aridad = 3)
% getNombrePdocs(ParadigmaDocs,Nombre) (ardiad = 2)
% getDatePdocs(ParadigmaDocs, Date) (aridad = 2)
% getRegistradosPdocs(ParadigmaDocs,Registrados) (aridad = 2)
% getActivosPdocs(ParadigmaDocs, Activos) (aridad = 2)
% getUserActivo(Activos, UserActivo) (aridad = 2)
% getDocumentosPdocs(ParadigmaDocs, Documents) (aridad = 2)
% paradigmadocsActualizado(Nombre,Fecha,ListRegistrados,ListActivo,ListDocumentos,PDOUT) (aridad = 6)
% getDiaFecha(Date,DD) (aridad = 2)
% getMesFecha(Date,MM) (aridad = 2)
% getAnioFecha(Date,AAAA) (aridad = 2)

% Metas primarias: paradigmaDocs, getNombrePdocs, getDatePdocs, getRegistradosPdocs, getUserActivo,
% getActivosPdocs, getDocumentosPdocs, paradigmaDocsActualizado, 
% Metas secundarias: getDiaFecha, getMesFecha, getAnioFecha

% -------------------------------------------REPRESENTACION--------------------------------------------------

% El TDA Paradigmadocs se representa a traves de una lista  (string X fecha X list X list X list) la cual 
% contiene un nombre, una fecha y tres listas inicialmente vacias donde seran guardados los usuarios 
% registrados, el usuario activo y los documentos.

% --------------------------------------------CONSTRUCTOR Y PERTENENCIA--------------------------------------

% Dominio: Un nombre de tipo string, una fecha y un TDA ParadigmaDocs
% Descripcion: Predicado que crea una plataforma de tipo paradigmaDocs
paradigmaDocs(Nombre,Date,[Nombre,Date,[],[],[]]):-
	string(Nombre),
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% ---------------------------------------------SELECTORES-----------------------------------------------------

% Dominio: Un paradigmaDocs y un nombre de tipo string
% Descripcion: Predicado que obtiene el nombre de una plataforma de tipo ParadigmaDocs
getNombrePdocs([Nombre|_],Nombre):-
	string(Nombre).

% Dominio: Un paradigmaDocs y una fecha de tipo date
% Descripcion: Predicado que obtiene la fecha de creacion de una plataforma de tipo ParadigmaDocs

getDatePdocs([_,Date,_,_,_], Date):-
	is_list(Date),
	length(Date,3),
	getDiaFecha(Date,DD),
	getMesFecha(Date,MM),
	getAnioFecha(Date,AAAA),
	date(DD,MM,AAAA,Date),!.

% Dominio: Un paradigmaDocs y una lista de usuarios registrados
% Descripcion: Predicado que obtiene la lista de usuarios registrados de una plataforma de tipo ParadigmaDocs
getRegistradosPdocs([_,_,Registrados,_,_],Registrados):-
	is_list(Registrados).

% Dominio: Un paradigmaDocs y una lista de users activos
% Descripcion: Predicado que obtiene la lista de User Activo de una plataforma de tipo ParadigmaDocs
getActivosPdocs([_,_,_,Activos,_], Activos):-
	is_list(Activos).

% Dominio: Una lista de user activo proveniente de paradigmaDocs
% Descripcion: Predicado que obtiene al user activo, si es que hay uno.
getUserActivo([UserActivo], UserActivo):-
	string(UserActivo).

% Dominio: Un paradigmaDocs y una lista de documentos
% Descripcion: Predicado que obtiene la lista de documentos de una plataforma de tipo ParadigmaDocs
getDocumentosPdocs([_,_,_,_,Documents], Documents):-
	is_list(Documents).

% ---------------------------------------------MODIFICADORES---------------------------------------

% Dominio: Un string, una date, tres listas, un integer y un TDA ParadigmaDocs
% Descripcion: Predicado que crea un TDA ParadigmaDocs actualizado, donde cualquier parte de este puede
% haber sido modificado
paradigmadocsActualizado(Nombre,Fecha,ListRegistrados,ListActivo,ListDocumentos,PDOUT):-
	PDOUT = [Nombre, Fecha, ListRegistrados,ListActivo,ListDocumentos].

/*____________________________________________________________________________________________________
  ____    ____    _____   ____    ___    ____      _      ____     ___    ____  
 |  _ \  |  _ \  | ____| |  _ \  |_ _|  / ___|    / \    |  _ \   / _ \  / ___| 
 | |_) | | |_) | |  _|   | | | |  | |  | |       / _ \   | | | | | | | | \___ \ 
 |  __/  |  _ <  | |___  | |_| |  | |  | |___   / ___ \  | |_| | | |_| |  ___) |
 |_|     |_| \_\ |_____| |____/  |___|  \____| /_/   \_\ |____/   \___/  |____/ 
                                                                                
   ___    ____    _       ___    ____      _      _____    ___    ____    ___    ___    ____  
  / _ \  | __ )  | |     |_ _|  / ___|    / \    |_   _|  / _ \  |  _ \  |_ _|  / _ \  / ___| 
 | | | | |  _ \  | |      | |  | |  _    / _ \     | |   | | | | | |_) |  | |  | | | | \___ \ 
 | |_| | | |_) | | |___   | |  | |_| |  / ___ \    | |   | |_| | |  _ <   | |  | |_| |  ___) |
  \___/  |____/  |_____| |___|  \____| /_/   \_\   |_|    \___/  |_| \_\ |___|  \___/  |____/ 
_______________________________________________________________________________________________________*/

% --------------------------------------PREDICADO PARADIGMADOCSREGISRER---------------------------------

% Dominio: Un paradigmaDocs, una fecha (date), un username (string), un password (string) y un
% paradigmaDocs actualizado
% Descripcion: Predicado que registra a un usuario dentro de paradigmaDocs, dejando registro de su fecha
% su username y su password dentro de la lista de users registrados. Si se intenta registrar a un usuario
% que ya esta registrado o se intenta registrar de forma incorrecta, se retorna false. Si en Sn2 se coloca
% a un paradigmaDocs que coincide con el paradigmaDocs resultante tras registrar al user, se retorna true,
% caso contrario, retorna false.
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

% --------------------------------------PREDICADO PARADIGMADOCSLOGIN--------------------------------------

% Dominio: Un paradigmaDocs, un username (string), un password (string) y un paradigmaDocs actualizado
% Descripcion: Predicado que loguea a un user registrado dentro de paradigmaDocs. El predicado verifica
% que las credenciales del user sean las correctas. Si las credenciales son incorrectas o se intenta loguear
% a un user que no esta registrado en paradigmaDocs, se retorna false.
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

% --------------------------------------PREDICADO PARADIGMADOCSCREATE-------------------------------------

% Dominio: Un paradigmaDocs, una fecha (date), un nombre (string), un contenido / texto (string) y un 
% paradigmaDocs actualizado.
% Descripcion: Predicado que crea un nuevo documento y lo guarda en la plataforma. El predicado se encarga
% de asignar el ID correcto al documento y de dejar al user actualmente activo como autor de este. Si no
% hay user activo, o  se intenta crear un documento erroneamente, se retorna false.
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

% --------------------------------------PREDICADO PARADIGMADOCSSHARE-------------------------------------

% Dominio: Un ID de documento (integer), una lista de permisos (list), una lista de usernames
% Descripcion: Predicado que comparte un Documento a otros usuarios. El autor por defecto tiene
% los 4 permisos disponibles. Si el user activo tiene permisos de compartir (ya sea porque es el
% autor o se le concedio) entonces puede dar permisos a otros usuarios para el documento que 
% tenga el ID ingresado. Si el documento no existe, se intenta dar permisos inexistentes o a 
% usuarios que no estan registrados en la plataforma o directamente no hay un user activo, se 
% retorna false.
paradigmaDocsShare(Sn1, DocumentId, ListaPermisos, ListaUsernamesPermitidos, Sn2):-
	integer(DocumentId),
	is_list(ListaPermisos),
	is_list(ListaUsernamesPermitidos),
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo,UserActivo),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	getDocumentosPdocs(Sn1,Documents),
	encontrarPorIDDocumento(Documents,DocumentId,DocCompartir),
	getAutorDocumento(DocCompartir,Autor),
	getDateDocumento(DocCompartir,Date),
	getNameDocumento(DocCompartir,Name),
	getContenidoDocumento(DocCompartir,Contenido),
	getPermisosDocumento(DocCompartir, PermisosPre),
	getHistorialDocumento(DocCompartir, HistorialDoc),
	puedeCompartir(PermisosPre, UserActivo),
	verificarPermisosValidos(ListaPermisos),
	verificarListaUsuarios(Users,ListaUsernamesPermitidos),
	tienenPermisos(PermisosPre, ListaUsernamesPermitidos, [], TienenPermisos),
	obtenerListaAccesos(ListaPermisos, ListaUsernamesPermitidos, PermisosPre, AccesesSinFiltro),
	borrarRepetidos(AccesesSinFiltro, TienenPermisos, AccessesFinal),
	(NewDocumento = [Autor,Date,Name,Contenido,AccessesFinal,HistorialDoc,DocumentId]),
	borrarDocDuplicado(DocCompartir, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], DocumentsFinal, Sn2), !.

% --------------------------------------PREDICADO PARADIGMADOCSADD-------------------------------------

% Dominio: Un paradigmaDocs, un ID de documento (integer), una fecha (date), un contenido / texto
% (string) y un paradigmaDocs actualizado
% Descripcion: Predicado que agrega texto a la parte final de la version activa de un documento. Si el 
% user activo tiene permisos de escritura (ya sea porque es el autor del documento o se le concedio),
% entonces el predicado funcionara sin problemas y la nueva version pasara a ser activa, quedando
% tambien registrada en el historial. Si no hay user activo, no existe el documento, se intenta usar
% este predicado sin tener permisos de escritura, o el formato del texto es incorrecto, se retorna false
paradigmaDocsAdd(Sn1, DocumentId, Date, ContenidoTexto, Sn2):-
	integer(DocumentId),
	string(ContenidoTexto),
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo,UserActivo),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	getDocumentosPdocs(Sn1,Documents),
	encontrarPorIDDocumento(Documents,DocumentId,DocEditar),
	getAutorDocumento(DocEditar,Autor),
	getDateDocumento(DocEditar,DateDoc),
	getNameDocumento(DocEditar,Name),
	getContenidoDocumento(DocEditar,Contenido),
	getPermisosDocumento(DocEditar, Permisos),
	getHistorialDocumento(DocEditar, HistorialDoc),
	puedeEditar(Permisos, UserActivo),
	string_concat(Contenido, ContenidoTexto, NewContenido),
	length(HistorialDoc, IDVersion),
	historial(Date, NewContenido, IDVersion, NewVersion),
	append(HistorialDoc, [NewVersion], NewHistorial),
	(NewDocumento = [Autor, DateDoc, Name, NewContenido, Permisos, NewHistorial, DocumentId]),
	borrarDocDuplicado(DocEditar, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], DocumentsFinal, Sn2), !.

% --------------------------------PREDICADO PARADIGMADOCSRESTOREVERSION---------------------------------

% Dominio: Un paradigmaDocs, un ID de documento (integer), un ID de version (integer) y un paradigmaDocs
% actualizado.
% Descripcion: Predicado que restaura una version en especifico de un documento en especifico. Si el user
% activo no es el autor del documento, o se intenta restaurar un documento o version que no existe o 
% directamente no hay user activo, se retorna false.
paradigmaDocsRestoreVersion(Sn1, DocumentId, IdVersion, Sn2):-
	integer(DocumentId),
	integer(IdVersion),
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo,UserActivo),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	getDocumentosPdocs(Sn1,Documents),
	encontrarPorIDDocumento(Documents,DocumentId,DocEditar),
	getAutorDocumento(DocEditar,Autor),
	(Autor == UserActivo),
	getDateDocumento(DocEditar,DateDoc),
	getNameDocumento(DocEditar,Name),
	getPermisosDocumento(DocEditar, Permisos),
	getHistorialDocumento(DocEditar, HistorialDoc),
	encontrarPorIDHistorial(HistorialDoc, IdVersion, DocVersion),
	getTextoHistorial(DocVersion, NewContent),
	(NewDocumento = [Autor, DateDoc, Name, NewContent, Permisos, HistorialDoc, DocumentId]),
	borrarDocDuplicado(DocEditar, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], DocumentsFinal, Sn2), !.

% --------------------------------PREDICADO PARADIGMADOCSTOSTRING--------------------------------------

% Dominio: Un paradimaDocs que puede contener o no a un User activo y un string
% Descripcion: Predicado que transforma todo el contenido de el paradigmaDocs ingresado a un string.
% Si se tiene a un user logueado, entonces el string contiene toda la informacion pertenenciente al 
% user logueado junto con los documentos que puede acceder y la informacion de estos. Si no se tiene
% a un user logueado, entonces el string contiene toda la informacion de la plataforma paradigmaDocs.
% Para visualizar correctamente el string, se debe usar "write()".
paradigmaDocsToString(Sn1, StrOut):-
	getActivosPdocs(Sn1, Activo),
	length(Activo, 0),
	getNombrePdocs(Sn1, NamePdocs),
	string_concat("---------- \nNombre de la plataforma: ", NamePdocs, S1),
	string_concat(S1, "\nFecha de creacion: ", S2),
	getDatePdocs(Sn1, DatePdocs),
	fecha_to_string(DatePdocs, DatePdocsString),
	string_concat(S2, DatePdocsString, S3),
	string_concat(S3, "\nUsuarios registrados en la plataforma: \n", S4),
	getRegistradosPdocs(Sn1,UsersRegistrados),
	maplist(userToString, UsersRegistrados, UserStringList),
	atomics_to_string(UserStringList, UsersString),
	string_concat(S4, UsersString, S5),
	string_concat(S5, "Documentos creados en la plataforma: \n", S6),
	getDocumentosPdocs(Sn1, Documents),
	maplist(documentoToString, Documents, ListDocsString),
	atomics_to_string(ListDocsString, RealDocsStrings),
	string_concat(S6, RealDocsStrings, StrOut), !.
paradigmaDocsToString(Sn1, StrOutUL):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo,UserActivo),
	string_concat("---------- \nNombre de Usuario: ", UserActivo, S1),
	string_concat(S1, '\n', S2),
	getRegistradosPdocs(Sn1, Users),
	getDocumentosPdocs(Sn1, Documents),
	obtenerDatosUser(Users, UserActivo, DataUser),
	getUserDate(DataUser, UserDate),
	fecha_to_string(UserDate, StringDate),
	string_concat(S2, "Fecha de registro: ", S3),
	string_concat(S3, StringDate, S4),
	string_concat(S4, '\n', S5),
	string_concat(S5, "Los documentos propios del usuario o los que tiene acceso son: \n", S6),
	obtenerDocsAcceso(Documents, UserActivo, [], AllDocsUser),
	maplist(documentoToString, AllDocsUser, ListDocsString),
	atomics_to_string(ListDocsString, RealDocsStrings),
	string_concat(S6, RealDocsStrings, StrOutUL), !.

% --------------------------------PREDICADO PARADIGMADOCSREVOKEALACCESSES----------------------------

% Dominio: Un paradigmaDocs, una lista de IDs y un paradigmaDocs actualizado
% Recorrido: Predicado que a traves de una lista de IDs, encuentra ciertos documentos y si el autor
% de los documentos corresponde al autor, entonces se eliminan todos los permisos de estos documentos
% ( a excepción de los permisos del autor). Si se intenta eliminar permisos de un documento que no 
% existe o que no es del user logueado, entonces se retorna False. Si la lista de IDs no contiene 
% elementos (es decir, esta vacia), entonces se eliminan los permisos de todos los documentos del user.
paradigmaDocsRevokeAllAccesses(Sn1,DocumentIds, Sn2):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, Documents),
	not(length(DocumentIds, 0)),
	obtenerDocumentosPropios(DocumentIds, Documents, UserActivo, [], DocumentosPropios),
	maplist(eliminarTodosLosPermisos, DocumentosPropios, DocumentosSinPermisos),
	eliminarDocsDuplicados(DocumentosPropios, Documents, NewDocuments),
	agregarNuevosDocs(DocumentosSinPermisos, NewDocuments, NewDocuments2),
	getNombrePdocs(Sn1, NamePdocs),
	getDatePdocs(Sn1, DatePdocs),
	getRegistradosPdocs(Sn1, Users),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], NewDocuments2, Sn2).
paradigmaDocsRevokeAllAccesses(Sn1,DocumentIds, Sn2Altern):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, Documents),
	length(DocumentIds, 0),
	obtenerDocumentosPorAutor(Documents, UserActivo,[], DocumentosPropios),
	maplist(eliminarTodosLosPermisos, DocumentosPropios, DocumentosSinPermisos),
	eliminarDocsDuplicados(DocumentosPropios, Documents, NewDocuments),
	agregarNuevosDocs(DocumentosSinPermisos, NewDocuments, NewDocuments2),
	getNombrePdocs(Sn1, NamePdocs),
	getDatePdocs(Sn1, DatePdocs),
	getRegistradosPdocs(Sn1, Users),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], NewDocuments2, Sn2Altern).

% --------------------------------PREDICADO PARADIGMADOCSSEARCH--------------------------------------

% Dominio: Un paradigmaDocs, un string y una lista de documentos
% Descripcion: Predicado que permite a un usuario hacer busquedas en uno o varios documentos. Esto 
% dependera si el usuario tiene documentos propios o que se le han compartido. Si tiene permisos
% de escritura o lectura, entonces si puede hacer busquedas. Si la busqueda coincide, entonces se
% agrega el documento a la lista de retorno. Caso contrario o si no hay un User logueado, se retorna
% false.
paradigmaDocsSearch(Sn1, SearchText,  Documents):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, DocumentsPdocs),
	obtenerDocsAcceso(DocumentsPdocs, UserActivo, [], AllDocsUser),
	maplist(getContenidoDocumento, AllDocsUser, ContentDocuments),
	searchInDocuments(ContentDocuments, SearchText, [], DocsTextFound),
	searchInDocsHist(AllDocsUser, SearchText, [], DocsHistTextFound),
	unirBusquedas(DocsTextFound, DocsHistTextFound, DocsTextFinal),
	DocsTextFinal = Documents, !.


% --------------------------------PREDICADO PARADIGMADOCSDELETE--------------------------------------

% Dominio: Un paradigmaDocs, un ID de documento, una fecha, un entero y un paradigmaDocs actualizado
% Descripcion: Predicado que elimina texto de la version activa de un documento en especifico y crea 
% una nueva version activa. La version antigua queda guardada en el historial. Si el numero de 
% caracteres a eliminar es mayor al numero de caracteres de la version activa, entonces se elimina
% todo el texto. Si no hay user logueado o se intenta eliminar contenido de un texto que no existe
% entonces se retorna false.
paradigmaDocsDelete(Sn1, DocumentId,  Date, NumberOfCharacters, Sn2):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, Documents),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	encontrarPorIDDocumento(Documents, DocumentId, DocEditar),
	getContenidoDocumento(DocEditar, Text),
	getPermisosDocumento(DocEditar, PermisosDoc),
	string_length(Text, LengthText),
	puedeEditar(PermisosDoc, UserActivo),
	(LengthText >= NumberOfCharacters),
	sub_string(Text, 0,_, NumberOfCharacters, NewContent),
	getAutorDocumento(DocEditar, Autor),
	getDateDocumento(DocEditar, DateDoc),
	getNameDocumento(DocEditar, NameDoc),
	getHistorialDocumento(DocEditar, HistorialDoc),
	length(HistorialDoc, IDVersion),
	historial(Date, NewContent, IDVersion, NewHistorialVer),
	append(HistorialDoc, [NewHistorialVer], NewHistorialDoc),
	NewDocumento = [Autor, DateDoc, NameDoc, NewContent, PermisosDoc, NewHistorialDoc, DocumentId],
	borrarDocDuplicado(DocEditar, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], DocumentsFinal, Sn2), !.
paradigmaDocsDelete(Sn1, DocumentId,  Date, NumberOfCharacters, Sn2_):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, Documents),
	getNombrePdocs(Sn1,NamePdocs),
	getDatePdocs(Sn1,DatePdocs),
	getRegistradosPdocs(Sn1,Users),
	encontrarPorIDDocumento(Documents, DocumentId, DocEditar),
	getContenidoDocumento(DocEditar, Text),
	getPermisosDocumento(DocEditar, PermisosDoc),
	string_length(Text, LengthText),
	puedeEditar(PermisosDoc, UserActivo),
	(LengthText < NumberOfCharacters),
	(NewContent = ""),
	getAutorDocumento(DocEditar, Autor),
	getDateDocumento(DocEditar, DateDoc),
	getNameDocumento(DocEditar, NameDoc),
	getHistorialDocumento(DocEditar, HistorialDoc),
	length(HistorialDoc, IDVersion),
	historial(Date, NewContent, IDVersion, NewHistorialVer),
	append(HistorialDoc, [NewHistorialVer], NewHistorialDoc),
	NewDocumento = [Autor, DateDoc, NameDoc, NewContent, PermisosDoc, NewHistorialDoc, DocumentId],
	borrarDocDuplicado(DocEditar, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs, DatePdocs, Users, [], DocumentsFinal, Sn2_), !.

% --------------------------------PREDICADO PARADIGMADOCSSEARCHANDREPLACE-----------------------------

% Dominio: Un paradigmaDocs, un ID de documento (intgeer), dos strings y un paradigmaDocs actualizado
% Descripcion: Predicado que permite realizar una busqueda de un texto en un documento en especifico y 
% si se  encuentra, reemplazarlo por otro. Se reemplazan todas las coincidencias del texto y se retorna
% el documento con el texto actualizado y una nueva version activa. La version activa queda guardada
% en el historial. Si no se encuentra el documento o se usa sin tener a un User logueado, se retorna
% false.
paradigmaDocsSearchAndReplace(Sn1, DocumentId, Text1, Text2, FechaVersion, Sn2):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	getUserActivo(Activo, UserActivo),
	getDocumentosPdocs(Sn1, Documents),
	encontrarPorIDDocumento(Documents,DocumentId,DocEditar),
	getPermisosDocumento(DocEditar, PermisosDoc),
	puedeEditar(PermisosDoc, UserActivo),
	getContenidoDocumento(DocEditar, TextDocumento),
	sub_string(TextDocumento, _, _, _, Text1),
	getNombrePdocs(Sn1, NamePdocs),
	getDatePdocs(Sn1, DatePdocs),
	getRegistradosPdocs(Sn1, Users),
	reemplazarPalabras(TextDocumento, Text1, Text2, [], NewTexto),
	getAutorDocumento(DocEditar, AutorDoc),
	getDateDocumento(DocEditar, DateDoc),
	getHistorialDocumento(DocEditar, HistorialDoc),
	getNameDocumento(DocEditar, NameDoc),
	length(HistorialDoc, NewIDVersion),
	historial(FechaVersion, NewTexto, NewIDVersion, NewVersionHist),
	append(HistorialDoc, [NewVersionHist], NewHistorialDoc),
	NewDocumento = [AutorDoc, DateDoc, NameDoc, NewTexto, PermisosDoc, NewHistorialDoc, DocumentId],
	borrarDocDuplicado(DocEditar, Documents, NewDocuments),
	append(NewDocuments, [NewDocumento], DocumentsFinal),
	paradigmadocsActualizado(NamePdocs,DatePdocs,Users,[],DocumentsFinal, Sn2).
paradigmaDocsSearchAndReplace(Sn1, _, _, _, Sn2):-
	getActivosPdocs(Sn1,Activo),
	length(Activo,1),
	write("No se encontraron coincidencias de busqueda y por lo tanto no se puede reemplazar el texto."),
	getNombrePdocs(Sn1, NamePdocs),
	getDatePdocs(Sn1, DatePdocs),
	getDocumentosPdocs(Sn1, Documents),
	getRegistradosPdocs(Sn1, Users),
	paradigmadocsActualizado(NamePdocs,DatePdocs,Users,[],Documents, Sn2).

/*______________________________________________________________________________________________________
  _____       _   _____   __  __   ____    _        ___    ____  
 | ____|     | | | ____| |  \/  | |  _ \  | |      / _ \  / ___| 
 |  _|    _  | | |  _|   | |\/| | | |_) | | |     | | | | \___ \ 
 | |___  | |_| | | |___  | |  | | |  __/  | |___  | |_| |  ___) |
 |_____|  \___/  |_____| |_|  |_| |_|     |_____|  \___/  |____/ 
_________________________________________________________________________________________________________*/

% --------------------------------Ejemplos Predicado Fecha------------------------------------------------

% EJ1: Se crean tres fechas. Estas seran usadas para los distintos predicados a continuacion
% date(20, 12, 2021, D1), date(20,01,2022, D2), date(3,1,2022,D3).

% --------------------------------Ejemplos Predicado ParadigmaDocs----------------------------------------

% EJ1: Se crea una plataforma paradigmaDocs, de nombre gDocs y cuya fecha de creacion es la fecha 1.
% date(20, 12, 2021, D1), date(21,01,2022, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1).

% --------------------------------Ejemplos Predicado ParadigmaDocsRegister--------------------------------

% EJ1: Se registran tres usuarios en la plataforma: user1, user2 y user3 (Salida: PD4)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4).

% EJ2: Se registran dos usuarios mas en la plataforma, pero uno de ellos ya esta registrado (Salida: false)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user2","pass2",PD6).

% EJ3: Se registran cinco usuarios en la plataforma: user1, user2, user3, user4, user5 (Salida: PD6)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6).

% --------------------------------Ejemplos Predicado ParadigmaDocsLogin------------------------------------

% EJ1: Se loguea user1 exitosamente (Salida: PD7)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7).

% EJ2: Se loguea user3 exitosamente (Salida: PD7)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user3", "pass3", PD7).

% EJ3: User3 se loguea pero se equivoca en su password (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user3", "passtress", PD7).

% EJ4: Se intenta loguear un user que no esta registrado en la plataforma (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user6", "pass6", PD7).

% --------------------------------Ejemplos Predicado ParadigmaDocsCreate-------------------------------------

% EJ1: User1 se loguea exitosamente y crea un documento en la plataforma (Salida: PD8)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8).

% EJ2: User2 se loguea exitosamente y crea un segundo documento en la plataforma (Salida: PD10)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10).

% EJ3: User1 se loguea y crea un tercer documento en la plataforma (Salida: PD12)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12).

% EJ4: Alguien intenta crear un Documento sin haberse logueado antes (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsCreate(PD6, D3, "lab4", "c#", PD7).

% --------------------------------Ejemplos Predicado ParadigmaDocsShare---------------------------------------

% EJ1: User1 se loguea exitosamente y le da permisos de escritura y de compartir a user2 y user3 en el Documento de ID 0 (Salida: PD14)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14).

% EJ2: User2 se loguea exitosamente y le da permisos de lectura y comentarios a user1 y user3 en el Documento de ID 1 (Salida: PD16)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16).

% EJ3: User3 se loguea exitosamente y gracias al permiso de compartir, le da permisos de lectura a User4 (Salida: PD18)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18). 

% EJ4: User4 se loguea exitosamente, pero intenta darse todos los permisos en un documento que no es de su propiedad (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user4","pass4", PD13), paradigmaDocsShare(PD13,0,["W","R","S","C"],["user4"],PD14).

% --------------------------------Ejemplos Predicado ParadigmaDocsAdd-----------------------------------------

% EJ1: User1 se loguea y agrega texto el texto "netbeans" en el Documento de ID 2 (Salida: PD20)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20).

% EJ2: User3 se loguea y gracias a sus permisos, agrega el texto "racket" en el Documento de ID 0 (Salida: PD22)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22).

% EJ3: User4 se loguea e intenta agregar texto al documento de ID 0, pero solo tiene permisos de lectura (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user4","pass4", PD21), paradigmaDocsAdd(PD21, 0, D2, "vsc", PD22).

% --------------------------------Ejemplos Predicado ParadigmaDocsRestoreVersion-------------------------------

% EJ1: User1 se loguea y restaura a la primera version del documento de ID 0 (Salida: PD24)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user1", "pass1", PD23), paradigmaDocsRestoreVersion(PD23, 0, 0, PD24).

% EJ2: User3 se loguea e intenta restaurar la primera version del documento de ID 1, pero no es el Autor (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user3", "pass3", PD23), paradigmaDocsRestoreVersion(PD23, 1, 0, PD24).

% EJ3: User2 se loguea e intenta restaurar una version que no existe del documento de ID 1 (Salida: False)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user2", "pass2", PD23), paradigmaDocsRestoreVersion(PD23, 1, 9, PD24).

% --------------------------------Ejemplos Predicado ParadigmaDocsToString-------------------------------

% EJ1: User1 se loguea y utiliza paradigmaDocsToString. Se muestra toda la informacion de User1 (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user1", "pass1", PD23), paradigmaDocsToString(PD23, Result).

% EJ2: User2 se loguea y utiliza paradigmaDocsToString. Se muestra toda la informacion de User2 (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user2", "pass2", PD23), paradigmaDocsToString(PD23, Result).

% EJ3: User3 se loguea y utiliza paradigmaDocsToString. Se muestra toda la informacion de User3 (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user3", "pass3", PD23), paradigmaDocsToString(PD23, Result).

% EJ4: User4 se loguea y utiliza paradigmaDocsToString. Se muestra toda la informacion de User4 (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user4", "pass4", PD23), paradigmaDocsToString(PD23, Result).

% EJ5: User5 se loguea y utiliza paradigmaDocsToString. Se muestra toda la informacion de User5 (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsLogin(PD22, "user5", "pass5", PD23), paradigmaDocsToString(PD23, Result).

% EJ5: Nadie se loguea en la plataforma y se utiliza paradigmaDocsToString. Se muestra toda la informacion de paradigmaDocs (Salida: Result)
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2),paradigmaDocsRegister(PD2,D2,"user2","pass2",PD3),paradigmaDocsRegister(PD3,D3,"user3","pass3",PD4), paradigmaDocsRegister(PD4,D2,"user4","pass4",PD5), paradigmaDocsRegister(PD5,D2,"user5","pass5",PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7),paradigmaDocsCreate(PD7,D1,"lab1","scheme",PD8), paradigmaDocsLogin(PD8, "user2","pass2", PD9), paradigmaDocsCreate(PD9, D2, "lab2", "prolog", PD10), paradigmaDocsLogin(PD10, "user1","pass1", PD11), paradigmaDocsCreate(PD11, D3, "lab3", "java", PD12), paradigmaDocsLogin(PD12, "user1","pass1", PD13), paradigmaDocsShare(PD13,0,["W","S"],["user2","user3"],PD14), paradigmaDocsLogin(PD14, "user2","pass2", PD15), paradigmaDocsShare(PD15,1,["R","C"],["user1","user3"],PD16), paradigmaDocsLogin(PD16, "user3","pass3", PD17), paradigmaDocsShare(PD17,0,["R"],["user4"],PD18), paradigmaDocsLogin(PD18, "user1","pass1", PD19), paradigmaDocsAdd(PD19,2,D3,"netbeans",PD20), paradigmaDocsLogin(PD20, "user3","pass3", PD21), paradigmaDocsAdd(PD21, 0, D2, "racket", PD22), paradigmaDocsToString(PD22, Result).


