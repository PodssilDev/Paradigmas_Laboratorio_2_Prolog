/*__________________________________________________________________________________________
  _          _      ____      ____          ____    ____     ___    _        ___     ____ 
 | |        / \    | __ )    |___ \   _    |  _ \  |  _ \   / _ \  | |      / _ \   / ___|
 | |       / _ \   |  _ \      __) | (_)   | |_) | | |_) | | | | | | |     | | | | | |  _ 
 | |___   / ___ \  | |_) |    / __/   _    |  __/  |  _ <  | |_| | | |___  | |_| | | |_| |
 |_____| /_/   \_\ |____/    |_____| (_)   |_|     |_| \_\  \___/  |_____|  \___/   \____|
_____________________________________________________________________________________________*/


/*____________________________________________________________________________________________
  _____   ____       _        _____                 _             
 |_   _| |  _ \     / \      |  ___|   ___    ___  | |__     __ _ 
   | |   | | | |   / _ \     | |_     / _ \  / __| | '_ \   / _` |
   | |   | |_| |  / ___ \    |  _|   |  __/ | (__  | | | | | (_| |
   |_|   |____/  /_/   \_\   |_|      \___|  \___| |_| |_|  \__,_|     
_______________________________________________________________________________________________*/

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

/*_______________________________________________________________________________________________
  _____   ____       _        _   _                     
 |_   _| |  _ \     / \      | | | |  ___    ___   _ __ 
   | |   | | | |   / _ \     | | | | / __|  / _ \ | '__|
   | |   | |_| |  / ___ \    | |_| | \__ \ |  __/ | |   
   |_|   |____/  /_/   \_\    \___/  |___/  \___| |_|   
__________________________________________________________________________________________________*/

% Dominio:
% Date: Date
% Nombre: String
% Password: String

% Predicados:
% user(Date,Nombre,Password,[Date,Nombre,Password])
% getUserDate([Date,Nombre,Password], Date)
% getUserName([Date,Nombre,Password], Nombre)
% getUserPass([Date,Nombre,Password], Password)
% pertenece(Nombre,[[_,Nombre,_]|_])
% pertenece(Nombre,[[_,_,_]|Resto])
% buscarUsuarioPassword([H|_],Usuario,Password):
% buscarUsuarioPassword([_|T],Usuario,Password)

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

% Dominio: Un Nombre (string) y un User
% Descripcion: Caso base de pertenece. Si el nombre es igual al nombre del User
% entonces el predicado da true.
pertenece(Nombre,[[_,Nombre,_]|_]):- !.
pertenece(Nombre,[[_,_,_]|OtherUsers]):-
            pertenece(Nombre,OtherUsers).

% Dominio: Un user, un username (string) y un password (string)
% Descripcion: Verifica si existe un User en la lista de Users tal que el username y
%  password coincidan con los ingresados por entrada
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
verificarListaUsuarios(UsersRegistrados, [Cabeza|Resto]):-
	pertenece(Cabeza, UsersRegistrados),
	verificarListaUsuarios(UsersRegistrados,Resto).

/*__________________________________________________________________________________________________
  _____   ____       _        _   _   _         _                    _           _ 
 |_   _| |  _ \     / \      | | | | (_)  ___  | |_    ___    _ __  (_)   __ _  | |
   | |   | | | |   / _ \     | |_| | | | / __| | __|  / _ \  | '__| | |  / _` | | |
   | |   | |_| |  / ___ \    |  _  | | | \__ \ | |_  | (_) | | |    | | | (_| | | |
   |_|   |____/  /_/   \_\   |_| |_| |_| |___/  \__|  \___/  |_|    |_|  \__,_| |_|
____________________________________________________________________________________________________*/
                                                                                 
% Dominio: 
% Date: Date (Lista de 3 integers)
% Contenido: String
% IDVer: Integer

% Predicados:
% historial(Date, Contenido, IDVer, [Date, Contenido, IDVer])
% getDateHistorial([Date,_,_], Date)
% getTextoHistorial([_,Texto,_], Texto)
% getIDHistorial([_,_,ID], ID)

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
getTextoHistorial([_,Texto,_], Texto):-
	string(Texto).

% Dominio: Una version de historial y un ID (integer)
% Descripcion: Predicado que obtiene el ID de una version de historial.
getIDHistorial([_,_,ID], ID):-
	integer(ID).

/*______________________________________________________________________________________________________
  _____   ____       _        ____                                                      _           
 |_   _| |  _ \     / \      |  _ \    ___     ___   _   _   _ __ ___     ___   _ __   | |_    ___  
   | |   | | | |   / _ \     | | | |  / _ \   / __| | | | | | '_ ` _ \   / _ \ | '_ \  | __|  / _ \ 
   | |   | |_| |  / ___ \    | |_| | | (_) | | (__  | |_| | | | | | | | |  __/ | | | | | |_  | (_) |
   |_|   |____/  /_/   \_\   |____/   \___/   \___|  \__,_| |_| |_| |_|  \___| |_| |_|  \__|  \___/ 
_________________________________________________________________________________________________________*/                                                                                                   
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
% encontrarPorIDDocumento([H|_],ID,Retorno)
% encontrarPorIDDocumento([_|T],ID,Retorno)
% primerElemento([Cabeza|_], Cabeza)
% restoElementos([_,Resto],Resto)

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
	historial(Date,Contenido,0, Hist1),
	DocFinal = [Autor,Date,Nombre,Contenido,[[Autor, "R", "W", "C", "S"]],[Hist1],IDDoc].

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
encontrarPorIDDocumento([H|_],ID,Retorno):-
    getIDDocumento(H,ID2),
    (ID2 = ID),
    H = Retorno.
encontrarPorIDDocumento([_|T],ID,Retorno):-
    encontrarPorIDDocumento(T,ID,Retorno).

% Dominio: Una lista y un elemento (puede ser de cualquier tipo)
% Descripcion: Predicado que obtiene el primer elemento de una lista
primerElemento([Cabeza|_], Cabeza).

% Dominio: Una lista y otra lista (la misma pero sin el primer elemento)
% Descripcion: Predicado que obtiene a la lista ingresada por entrada sin el primer elemento de esta
restoElementos([_,Resto],Resto).

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
verificarCompartir([Cabeza|_]):-
	Cabeza = "S".
verificarCompartir([_|Resto]):-
	verificarCompartir(Resto).

% Dominio: Una lista de sublistas de permisos y un User
% Descripcion: Predicado que recorre toda la lista de sublistas de permisos para verificar si un User tiene
% el permiso de compartir ("S")
puedeCompartir(ListPermiso,UserActivo) :-
	buscarPermiso(ListPermiso, UserActivo, PermisosUser),
	verificarCompartir(PermisosUser), !.

% Dominio: Una lista que contiene un username y permisos (strings)
% Descripcion: Predicado que verifica si en la lista de permisos se encuentra el permiso de escritura ("W")
verificarEditar([Cabeza|_]):-
	Cabeza = "W".
verificarEditar([_|Resto]):-
	verificarEditar(Resto).

% Dominio: Una lista de sublistas de permisos y un User
% Descripcion: Predicado que recorre toda la lista de sublistas de permisos para verificar si un User tiene
% el permiso de compartir ("W")
puedeEditar(ListPermiso,UserActivo) :-
	buscarPermiso(ListPermiso, UserActivo, PermisosUser),
	verificarEditar(PermisosUser), !.

% Dominio: Una lista de solo permisos (strings)
% Descripcion: Predicado que verifica si una lista de solo permisos tiene solo permisos validos
verificarPermisosValidos([]).
verificarPermisosValidos([H|T]):-
	permisoValido(H),
	verificarPermisosValidos(T).

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
tienePoder([H|_], User, ListaTemp, ListaResultante):-
	primerElemento(H, Nombre),
	(User == Nombre),
	append([User], ListaTemp, ListaResultante).
tienePoder([_|T], User, ListaTemp, ListaResultante):-
	tienePoder(T, User, ListaTemp, ListaResultante).

% Dominio: Una lista de permisos y tres listas de users
% Descripcion: Predicado que verifica cuales son los users que ya tienen permisos en un documento y si
% estos corresponden a algunos de los users de la lista de usernames permitidos
tienenPermisos(_,[],ListGuardado,ListResultado):-
	(ListGuardado = ListResultado).
tienenPermisos(ListaPermisos, [H|T], ListGuardado, ListResultado):-
	tienePoder(ListaPermisos, H, ListGuardado, ListTemp),
	tienenPermisos(ListaPermisos,T,ListTemp,ListResultado).

% Dominio: Un username, una lista de permisos sin filtrar y una lista de permisos filtradas
% Descripcion: Predicado que elimina una lista de permisos duplicadas de un usuario. El predicado siempre
% elimina los permisos antiguos y deja los nuevos, o elimina los duplicados en caso de que los permisos sean
% iguales a los que ya tenia.
borrarPrimeraOcurrenciaPermiso( Elemento, [H|Resto], Resto ):-
    primerElemento(H,Nombre),
    (Elemento == Nombre).
borrarPrimeraOcurrenciaPermiso( Elemento, [Cabeza|Resto], [Cabeza|Resultado] ) :-
	Elemento\=Cabeza,
	borrarPrimeraOcurrenciaPermiso( Elemento, Resto, Resultado ).

% Dominio: Una lista de permisos sin filtrar, una lista de usernames y una lista de permisos filtradas
% Descripcion: Predicado que filtra la lista de permisos de un documento, eliminando aquellos permisos
% repetidos y evitando que un mismo user tenga mas de una lista de permisos
borrarRepetidos(Accesses, [], AcccessesFinal):-
	(Accesses = AcccessesFinal).
borrarRepetidos(Accesses, [H|T], AccessesFinal):-
	borrarPrimeraOcurrenciaPermiso(H, Accesses, AccessesTemp),
	borrarRepetidos(AccessesTemp, T, AccessesFinal).

% Dominio: Un documento, una lista de documentos y una lista de documentos filtrada
% Descripcion: Predicado que elimina a un documento que va a ser reemplazado por una version actualizada
% de este, evitando asi que hayan dos documentos con el mismo ID.
borrarDocDuplicado( Documento, [H|Resto], Resto ):-
    (Documento == H).
borrarDocDuplicado( Documento, [Cabeza|Resto], [Cabeza|Resultado] ) :-
	Documento\=Cabeza,
	borrarDocDuplicado( Documento, Resto, Resultado ).

% Dominio: Un Historial de un documento, un ID (integer) y una version de un documento
% Descripcion: Predicado que encuentra una version del historial de versiones de un documento, a traves
% de su ID.
encontrarPorIDHistorial([H|_],IDVersion,Retorno):-
    getIDHistorial(H,ID2),
    (ID2 = IDVersion),
    H = Retorno.
encontrarPorIDHistorial([_|T],ID,Retorno):-
    encontrarPorIDHistorial(T,ID,Retorno).

/*____________________________________________________________________________________________________________
 _____  ____      _     ____                          _  _                            ____                       
|_   _||  _ \    / \   |  _ \   __ _  _ __   __ _   __| |(_)  __ _  _ __ ___    __ _  |  _ \   ___    ___  ___ 
  | |  | | | |  / _ \  | |_) | / _` || '__| / _` | / _` || | / _` || '_ ` _ \  / _` | | | | | / _ \  / __|/ __|
  | |  | |_| | / ___ \ |  __/ | (_| || |   | (_| || (_| || || (_| || | | | | || (_| | | |_| || (_) || (__ \__ \
  |_|  |____/ /_/   \_\|_|     \__,_||_|    \__,_| \__,_||_| \__, ||_| |_| |_| \__,_| |____/  \___/  \___||___
______________________________________________________________________________________________________________*/
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
getUserActivo([UserAct], UserAct):-
	string(UserAct).

% Dominio: Un paradigmaDocs y una lista de documentos
% Descripcion: Predicado que obtiene la lista de documentos de una plataforma de tipo ParadigmaDocs
getDocumentosPdocs([_,_,_,_,Docs], Docs):-
	is_list(Docs).

% ---------------------------------------------MODIFICADORES---------------------------------------

% Dominio: Un string, una date, tres listas, un integer y un TDA ParadigmaDocs
% Descripcion: Predicado que crea un TDA ParadigmaDocs actualizado, donde cualquier parte de este puede
% haber sido modificado
paradigmadocsActualizado(Nombre,Fecha,ListRegistrados,ListActivo,ListDocumento,PDOUT):-
	PDOUT = [Nombre, Fecha, ListRegistrados,ListActivo,ListDocumento].

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

% Dominio:
% Descripcion:
% paradigmaDocsToString(Sn1, StrOut):-

/*______________________________________________________________________________________________________
  _____       _   _____   __  __   ____    _        ___    ____  
 | ____|     | | | ____| |  \/  | |  _ \  | |      / _ \  / ___| 
 |  _|    _  | | |  _|   | |\/| | | |_) | | |     | | | | \___ \ 
 | |___  | |_| | | |___  | |  | | |  __/  | |___  | |_| |  ___) |
 |_____|  \___/  |_____| |_|  |_| |_|     |_____|  \___/  |____/ 
_________________________________________________________________________________________________________*/


% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2), paradigmaDocsRegister(PD2,D2,"user2", "pass2", PD3).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2), paradigmaDocsRegister(PD2,D2,"user2", "pass2", PD3), paradigmaDocsRegister(PD3,D3,"user3", "pass3", PD4).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2), paradigmaDocsRegister(PD2,D2,"user2", "pass2", PD3), paradigmaDocsRegister(PD3,D3,"user3", "pass3", PD4), paradigmaDocsLogin(PD4, "user1", "pass1", PD5), paradigmaDocsCreate(PD5, D1, "lab1","scheme", PD6).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2), paradigmaDocsRegister(PD2,D2,"user2", "pass2", PD3), paradigmaDocsRegister(PD3,D3,"user3", "pass3", PD4), paradigmaDocsLogin(PD4, "user1", "pass1", PD5), paradigmaDocsCreate(PD5, D1, "lab1","scheme", PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7), paradigmaDocsAdd(PD7, 0, D2, "newtext", PD8).
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1,D1,"user1", "pass1", PD2), paradigmaDocsRegister(PD2,D2,"user2", "pass2", PD3), paradigmaDocsRegister(PD3,D3,"user3", "pass3", PD4), paradigmaDocsLogin(PD4, "user1", "pass1", PD5), paradigmaDocsCreate(PD5, D1, "lab1","scheme", PD6), paradigmaDocsLogin(PD6, "user1", "pass1", PD7), paradigmaDocsAdd(PD7, 0, D2, "newtext", PD8), paradigmaDocsLogin(PD8, "user1", "pass1", PD9), paradigmaDocsRestoreVersion(PD9, 0, 0, PD10).