{2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego 
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}

program ejercicio2;
type
	lista = ^nodo;
	
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;

procedure leerPersona(VAR p: persona);// ES VAR EN P
	begin
	readln(p.dni);
		if (p.dni <> 0)then begin
			readln(p.nombre);
			readln(p.apellido);
		end;
	end;
{Agrega un nodo a la lista}
procedure agregarAdelante(var l:lista; p:persona);//ES VAR EN L
	var
		aux: lista;
	begin
		//FALTA EL NEW(AUX);
		new(aux);
		aux^.dato:= p;
		aux^.sig:= l;
		l:= aux;
	end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
	var
		p:persona; //ES PERSONA NO NODO
	begin
		leerPersona(p);
		while (p.dni <> 0) do begin
			agregarAdelante(l,p);
			//FALTA UN leerPersona(p);
			leerPersona(p);
		end;
	end;
procedure imprimirInformacion(l:lista); //NO ES NECESARIO VAR
	begin
		while (l <> nil) do begin
			writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.dato.nombre, 'Apellido:', l^.dato.apellido);// FALTA DATO EN NOMBRE Y APELLIDO
			l:= l^.sig;
		end;
	end;
{Programa principal}
var
	l:lista;
begin
	//FALTA L:=NIL
	l:=nil;
	generarLista(l);
	imprimirInformacion(l);
	readln();
end.
