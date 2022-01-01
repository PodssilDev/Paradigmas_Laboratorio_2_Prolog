# Laboratorio 2 Paradigmas de Programación: Paradigma Lógico
**Autor:** John Serrano Carrasco
**Seccion:** 13310-0-A-1
**Fecha de inicio:** 18 de Noviembre de 2021
**Fecha de Entrega:** 03 de Enero de 2022

## Descripción
Este es el respositorio de mi **laboratorio 2** del curso de Paradigmas de Programación impartido en la Universidad de Santiago. En este laboratorio se ve la programación lógica, a traves del lenguaje de programación Prolog donde se busca crear una simulación a algo similar a una plataforma estilo Google Docs.
Para ello, se crearon distintos TDAs o Tipos de Datos Abstractos, como por ejemplo:
* TDA Paradigmadocs - consiste en el TDA de una plataforma estilo Google Docs. 
* TDA Documento - representa a un documento donde se tiene el autor de este, fecha de creacion, nombre del documento, contenido, entre otras cosas.
* TDA User - representa a un usuario donde se tiene su fecha de registro, su username y su password. 
* TDA Historial - corresponde a un historial de versiones de un documento
* TDA Fecha - donde se tiene una fecha con formato dd mm aaaa. 

* Cada TDA tiene sus predicados, respetando lo visto en clase como lo son constructores, predicados de pertenencia, selectores, modificadores y otros predicados.
Todos estos TDAs junto con los predicados obligatorios y opcionales, son creados en el archivo [main] (https://github.com/PodssilDev/lab2_20537567_Serrano/blob/95aea3939e415b5f40872aca0fc43c9752ea0ab8/main.pl). Al final de este archivo se encuentran los ejemplos de prueba de tanto los predicados obligatorios como los predicados opcionales. **Se crearon 11/11 predicados en total, 7/7 obligatorios y 4/4 opcionales.**
## Prerrequisitos
Se necesita del programa [Swi-Prolog] (https://www.swi-prolog.org/Download.html) versión 8.X.X o superior para ejecutar el código. También es posible ejecutar el código utilizando [Visual-Studio-Code] (https://code.visualstudio.com) con la extension de Swi-Prolog.
## Como ejecutar
El archivo main trae ejemplos para sus funciones en la parte final, en forma de comentarios. Para ejecutar estos ejemplos primero se debe cargar la base de conocimientos, o bien, si se esta utilizando Visual Studio Code, se debe escribir consult('main_20537567_SerranoCarrasco.pl'). Si prolog retorna True, entonces la base de conocimientos ya esta cargada y lo unico que debe hacerse para probar los ejemplos es copiar el codigo (sin el % de comentario) y colocarlo en la consola. Por ejemplo, para el ejemplo: 
```sh
% date(20, 12, 2021, D1), date(21,12,2021, D2), date(3,1,2022,D3), paradigmaDocs("gDocs", D1, PD1), paradigmaDocsRegister(PD1, D1, "user1", "pass1", PD2)
```
solo se debe escribir todo sin el %, el cual es el simbolo de comentario,  en la consola para poder ejecutar este ejemplo de la función Register.
Para facilitar el proceso de prueba, se puede clonar el repositorio: 
```sh
git clone https://github.com/PodssilDev/lab2_20537567_Serrano.git
```
