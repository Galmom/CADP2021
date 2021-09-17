{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron 
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron 
ingresados, manteniendo un puntero al último ingresado.}

program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end; 

procedure armarNodo(var L: lista; v: integer); //agrega a la izquierda
	var
		aux, act : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if (l <> nil) then begin
			act:=l;
			while (act^.sig <> nil) do
				act:=act^.sig;
			act^.sig:=aux;
		end	
		else	
			l:=aux;
	end;

{procedure armarNodo(var L, ult: lista; v: integer); //puntero al ultimo NODO a la derecha
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if (l <> nil) then
			ult^.sig:=aux //si tiene elementos la lista
		else	
			l:=aux; //si no tiene elementos la lista
		ult := aux;
	end;}

procedure incremento(var p:lista; v:integer);
	begin
		while (p <> nil) do begin
			//writeln(p^.num+v); SI SACO VAR LO IMPRIMO SIN MODIFICAR Y CHAU, CON VAR ES LOS DOS DE ABAJO (23 - 24)
			p^.num:=p^.num+v;
			writeln(p^.num);
			p:=p^.sig;
		end;
	end;

procedure imprimir(p:lista);
	begin
		while (p <> nil) do begin
			writeln(p^.num);
			p:=p^.sig;
		end;
	end;	

var
	pri, ult: lista;
	valor : integer;
begin
	pri := nil;
	ult := nil;
	writeln('Ingrese un numero'); 
	readln(valor);
while (valor <> 0) do begin
	armarNodo(pri, valor);
	//armarNodo(pri, ult, valor);//puntero al ultimo NODO
	writeln('Ingrese un numero');
	readln(valor);
end;
imprimir(pri);
writeln('Ingrese un valor');
readln(valor);
incremento(pri, valor);
imprimir(pri);
readln();
end.