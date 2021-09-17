{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les 
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el 
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse. 
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados 
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor 
a menor).}

program ejer;
type
    egresado=record
        num_alumno:integer;
        apellido:string[20];
        promedio:real;
    end;

    lista=^nodo;
    
    nodo=record
        dato:egresado;
        sig:lista;
    end;

procedure leer(var egre:egresado);
begin
    writeln('Ingrese el numero de alumno ');
    readln(egre.num_alumno);
    if (egre.num_alumno <> 0) then begin
        writeln('Ingrese el apellido');
        readln(egre.apellido);
        writeln('Ingrese el promedio');
        readln(egre.promedio);
    end;
end;

procedure agregarordenado(var l:lista; egre:egresado);
var
  ant, act, nue:lista;
begin
    new(nue);
    nue^.dato:=egre;
    act:=l;
    ant:=l;
    while (act <> nil) and (egre.promedio <  act^.dato.promedio)  do begin
         ant:=act;
         act:=act^.sig;
    end;
       if (act = ant) then
            l:=nue
        else
            ant^.sig:=nue;
    nue^.sig:=act;
end;


procedure cargar(var l:lista);
var
  egre:egresado;
begin
    leer(egre);
    while (egre.num_alumno <> 0) do begin
        agregarordenado(l,egre);
        leer(egre);
    end;
end;


var
  l:lista;
  i:integer;
begin
    l:=nil;
    cargar(l);
    writeln('Los alumnos que recibiran el promemio son');
    for i:=1 to 10 do begin
         writeln(l^.dato.apellido,' ',l^.dato.num_alumno);
        l:= l^.sig;
    end;
    readln;
end.