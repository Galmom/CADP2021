program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end; 

procedure armarNodo(var L: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := L;
		L := aux;
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
	armarNodo(pri, valor);
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
