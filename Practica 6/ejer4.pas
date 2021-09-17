{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la 
lista que son múltiplos de A.
}

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

procedure incremento(p:lista; v:integer);
	begin
		while (p <> nil) do begin
			writeln(p^.num+v); //SI SACO VAR LO IMPRIMO SIN MODIFICAR Y CHAU, CON VAR ES LOS DOS DE ABAJO (23 - 24)
			// p^.num:=p^.num+v;
			// writeln(p^.num);
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

function maximo(p:lista):integer;
	var
		max:integer;
	begin
		max:=-1;
		while (p <> nil) do begin
			if (p^.num > max) then
				max:=p^.num;
			p:=p^.sig;	
		end;
		maximo:=max;
	end;	

function minimo(p:lista):integer;
	var
		min:integer;
	begin
		min:=9999;
		while (p <> nil) do begin
			if (p^.num < min) then
				min:=p^.num;
			p:=p^.sig;	
		end;
		minimo:=min;
	end;

procedure multiplos(p:lista; v:integer; var cant_multiplo:integer);
	begin
		while (p <> nil) do begin
			if ((p^.num mod v) = 0) then
				cant_multiplo:=cant_multiplo+1;
			p:=p^.sig;	
		end;
	end;

var
	pri : lista;
	valor, cant_multiplo: integer;
begin
	cant_multiplo:=0;
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
writeln('El maximo es ',maximo(pri));
writeln('El minimo es ',minimo(pri));
writeln('Ingrese el valor del multiplo');
readln(valor);
multiplos(pri, valor, cant_multiplo);
writeln('la cantidad de elementos de la lista que son multiplos es ',cant_multiplo);
readln();
end.