{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista 
queden ordenados de manera ascendente (insertar ordenado).}

program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end; 

procedure armarNodoORDENADO(var l: lista; v: integer);
	var
		ant, act, aux: lista;
	begin
		new(aux);
		aux^.num := v;
		act:=l;
		ant:=l;
		while (act <> nil) and (act^.num < v) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant = act) then
			l:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;		
	end;

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
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero'); 
	readln(valor);
while (valor <> 0) do begin
	armarNodoORDENADO(pri, valor);
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