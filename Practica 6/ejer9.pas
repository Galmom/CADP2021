{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en 
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: 
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos 
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera 
ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera 
descendente.}

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

function estaordenada(p:lista):boolean;
	var
		maximo:integer;
		ordenado:boolean;
	begin
		maximo:=-1;
		ordenado:=true;
		while (p <> nil) and (ordenado) do begin
			if (p^.num > maximo) then
				maximo:=p^.num
			else
				ordenado:=false;
			p:=p^.sig;
		end;
		estaordenada:=ordenado;
	end;

procedure eliminar(var p:lista; valor:integer);
	var
		ant, act:lista;
		exito:boolean;
	begin
		exito:=false;
		act:=p;
		ant:=p;
		while (act <> nil) and (act^.num <> valor) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act <> nil) then begin
			exito:=true;
			if (act = p) then
				p:=act^.sig
			else
				ant^.sig:=act^.sig;
			dispose(act);
			end;
		if (exito) then
			writeln('SE BORRO')
		else
			writeln('NO SE BORRO');
	end;

procedure sublista(p:lista; var p2:lista; valor, valor1:integer);
	begin
		while (p <> nil) do begin
			if (p^.num > valor) and (p^.num < valor1) then begin //punto d y e son mas o menos igual cambiando el odern de los < y > 
				armarNodoORDENADO(p2, p^.num);
				writeln('Cumple ', p^.num);
			end;
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
	pri, pri2 : lista;
	valor, valor1: integer;
begin
	pri2:=nil;
	pri := nil;
	writeln('Ingrese un numero'); 
	readln(valor);
while (valor <> 0) do begin
	armarNodoORDENADO(pri, valor);
	writeln('Ingrese un numero');
	readln(valor);
end;
imprimir(pri);
if (estaordenada(pri)) then
	writeln('ESTA ORDENADO')
else
	writeln('NO ESTA ORDENADO');
writeln('Ingrese un valor a ELIMINAR');
readln(valor);
//eliminar(pri, valor);
writeln('Ingrese dos valores');
readln(valor);
readln(valor1);
sublista(pri, pri2, valor, valor1);
imprimir(pri2);
writeln('Ingrese un valor para incrementar');
readln(valor);
incremento(pri, valor);
imprimir(pri);
readln();
end.