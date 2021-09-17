{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su 
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número 
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número, 
en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes 
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna 
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista 
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos 
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por 
vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}

program eje;
type
		cliente=record
				dni:integer;
				num_espera:integer;
				end;

		lista=^nodo;

		nodo=record
			dato:cliente;
			sig:lista;
			end;

	procedure leerdni(var c:cliente; cant_cliente:integer);
		begin
			writeln('Ingrese el DNI');
			readln(c.dni);
			if (c.dni <> 0) then
			  c.num_espera:=cant_cliente+1;
		end;

	procedure agregaradelante(var l:lista; c:cliente);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=c;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure carga(var l:lista);
		var
			c:cliente;
			cant_cliente:integer;
		begin
			cant_cliente:=0;
			leerdni(c, cant_cliente);
			while (c.dni <> 0) do begin
				agregaradelante(l, c);
				cant_cliente:=cant_cliente+1;
				leerdni(c, cant_cliente);
			end;
		end;

	procedure RecibirCliente(var l:lista; v:integer);
		var
			act, ant, nue:lista;
		begin
			new(nue);
			nue^.dato.dni:=v;
			nue^.dato.num_espera:=l^.dato.num_espera+1;
			act:=l;
			ant:=l;
			//LO QUER PASA EN EL WHILE ES, ACT LLEGO ACTUAL ENTONCES FALLA O LO OTRO ES FALSO
			while (act <> nil) and (act^.dato.num_espera < l^.dato.num_espera) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (ant = act) then
				l:= nue
			else
				ant^.sig:=nue;
			nue^.sig:=act;
		end;

	procedure AtenderCliente(var l:lista; var numero_atend, dni_atend:integer);
		var
			valor:integer;
			exito:boolean;
			ant, act:lista;
		begin
			exito:=false;
			act:=l;
			ant:=l;	
			writeln('Ingrese el turno a atender');
			readln(valor);			
			while (act <> nil) and (act^.dato.num_espera <> valor) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act <> nil) then begin
				exito:=true;
				if (act = l) then 
					l:=act^.sig
				else
					ant^.sig:=act^.sig;
				numero_atend:=l^.dato.num_espera;
				dni_atend:=l^.dato.dni;
				dispose(act);		
			end;
			if (exito) then
				writeln('Se elimino turno')
			else
				writeln('NO se elimino turno');	
		end;

var
	l:lista;
	valor, numero_atend, dni_atend :integer;
begin
	l:=nil;
	valor:=0;
	carga(l);
	writeln('Ingrese un nuevo cliente');
	readln(valor);
	RecibirCliente(l, valor);
	AtenderCliente(l, numero_atend, dni_atend);
	writeln('El cliente ',numero_atend,' del DNI ' ,dni_atend,' es atendido');
	readln();
end.