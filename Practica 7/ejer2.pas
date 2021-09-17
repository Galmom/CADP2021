{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}
program ejer;
type
	string20=string[20];
	rango=1..6;

	cliente=record
		cod_cliente:integer;
		dni:integer;
		apellido:string20;
		nombre:string20;
		cod_poliza:rango;
		abono_mensu:real;
		end;
	lista=^nodo;
	
	nodo=record
		dato:cliente;
		sig:lista;
		end;

	vector_tabla=array[rango] of integer;

	procedure leerpersona(var p:cliente);
		begin
			writeln('Ingrese el codigo del cliente');
			readln(p.cod_cliente);
			writeln('Ingrese el DNI');
			readln(p.dni);
			writeln('Ingrese el apellido');
			readln(p.apellido);
			writeln('Ingrese el nombre');
			readln(p.nombre);
			writeln('Ingrese el codigo de poliza');
			readln(p.cod_poliza);
			writeln('Ingrese el abono mensual');
			readln(p.abono_mensu);
		end;

	procedure agregaradelante(var l:lista; p:cliente);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=p;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);
		var
			p:cliente;
		begin
			repeat
				leerpersona(p);
				agregaradelante(l, p);
			until (p.cod_cliente <> 1122);
		end;


	function monto_completo(cod_poliza:integer; tb:vector_tabla; abono_mensu:real):real;
		begin
			monto_completo:=tb[cod_poliza]+abono_mensu;
		end;

	function cant_digitos(dni:integer):boolean;
		var
			cant, digito:integer;
		begin
			digito:=0;
			cant:=0;
			while (dni <> 0) and (cant < 3) do begin
				digito:= dni mod 10;
				if (digito = 9) then
					cant:=cant+1;
				dni:=dni div 10;
			end;
			if (cant > 1) then
				cant_digitos:=true
			else
				cant_digitos:=false;	
		end;

	procedure recorrerlista(l:lista; tb:vector_tabla);
		begin
			while (l <> nil) do begin
				write('Para el cliente ',l^.dato.dni, ' ',l^.dato.apellido,' ',l^.dato.nombre);
				writeln(' el monto completo a pagar es ', monto_completo(l^.dato.cod_poliza, tb, l^.dato.abono_mensu):4:2);
				if (cant_digitos(l^.dato.dni) = true) then
					writeln('El cliente ',l^.dato.apellido,' , ',l^.dato.nombre,' su DNI contiene al menos dos dígitos 9');
				l:=l^.sig;
			end;
		end;
	procedure busquedayborrado(var li:lista; valor:integer);	
		var
			ant, act:lista;
			exito:boolean;
		begin
			act:=li;
			ant:=li;
			exito:=false;
			while (act <> nil) and (act^.dato.cod_cliente <> valor) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act <> nil) then begin
				exito:=true;
				if (act = li) then
					li:=act^.sig
				else
					ant^.sig:=act^.sig;
			dispose(act);			
			end;
		end;

	var
		l:lista;
		tb:vector_tabla;
		valor:integer;
	begin
		valor:=0;
		l:=nil;
		//tabla(tb); SE DISPONE
		cargarlista(l);
		recorrerlista(l, tb);
		writeln('Ingrese un código de cliente');
		readln(valor);
		busquedayborrado(l, valor);
		readln;
	end.