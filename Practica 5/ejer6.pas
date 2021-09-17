6) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá
tener una longitud máxima de 50 caracteres.
{=========================================================================}
a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.
program ejer;
const
	max_2500=2500;
type
	nombre=String[20];
	puntero= ^ nombre;
	vector=array[1..max_2500] of puntero; 50000 bytes
{=========================================================================}

b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:
Type 
	Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
Var
Punteros: ArrPunteros;

{=========================================================================}
b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
	dimf*tipo de elemento (2500*4) = 10000 porque tengo punteros nada mas que es 4
{=========================================================================}
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?

{=========================================================================}
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.
Program ejer14;
Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..3] of Puntero;// vector de puntero, que apunta a nombre

procedure carga(var p:ArrPunteros); // RECIBE EL VECTOR EN FORMA DE REFERENCIA
    var
      i:integer;
    begin
      i:=0;
      for i:=1 to 2500 do begin // UN FOR PARA RECORRER LOS 2500 LUGARES DEL VECTOR
      	writeln('Ingrese un nombre'); 
        new(p[i]);//3 SE RESERVA ESPACIO
        readln(p[i]^);// 4 SE GUARDA EL DATO EN EL LUGAR DONDE APUNTA EL VECTOR
      end;
    end; 
  procedure ver(p:ArrPunteros);
    Var
      i:integer;
    begin
      i:=0;
      for i:=1 to 3 do begin
        writeln(p[i]^);
      end;
    end;

Var
	Punteros: ArrPunteros;// 1 DECLARO LA VARIABLE PUNTEROS DE TIPO VECTOR
begin
	carga(Punteros);// 2 CARGO EL VECTOR 
	ver(Punteros);
	readln();
end.