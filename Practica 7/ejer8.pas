{8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.
}
program ejer;

type
	rango=1..7;

	mes_dia=record
		mes:1..11;
		dia:1..31
		end;

	transfer=record
		num_cuenta_origen:integer;
		dni_origen:integer;
		num_cuenta_destino:integer;
		dni_destino:integer;
		fecha:mes_dia;
		hora:integer;
		monto:real;
		cod_motivo_transfer:rango
		end;
	lista=^nodo;
	
	nodo=record
		dato:transfer;
		sig:lista;
		end;

	vector_motivo=array[rango] of integer;

	procedure cargarvector(var vm:vector_motivo);
		var
			i:rango;
		begin
			for i:=1 to 7 do
				vm[i]:=0;
		end;		

	procedure cargarordenado(var l_terce:lista; t:transfer);
		var
			act, ant, nue:lista;
		begin
			new(nue);
			nue^.dato:=t;
			ant:=l_terce;
			act:=l_terce;
			while (act <> nil) and (act^.dato.num_cuenta_origen < t.num_cuenta_origen) do begin	
				ant:=act;
				act:=act^.sig;
			end;
			if (act = ant) then
				l_terce:=nue
			else
				ant^.sig:=nue;
			nue^.sig:=act;		
		end;

	function cuentamotivo(vm:vector_motivo):integer;
		var
			i:rango;
			max, cod:integer;
		begin
			max:=-1;
			for i:=1 to 7 do
				if (vm[i] > max) then begin
					max:=vm[i];
					cod:=i;
				end;
			cuentamotivo:=cod;	
		end;

	function digito_pares(num:integer):boolean;
		var
			digito, cant_par, cant_impar:integer;
		begin
			digito:=0;
			cant_par:=0;
			cant_impar:=0;
			while (num <> 0) do begin
				digito:=num mod 10;
				if (digito mod 2 = 0) then
					cant_par:=cant_par+1
				else
					cant_impar:=cant_impar+1;
				num:=num div 10;
			end;
			if (cant_par > cant_impar) then
				digito_pares:=true
			else
				digito_pares:=false;	
		end;

	procedure recorrerlista(l:lista);
		var
			l_terce:lista;
			actual, cant_trans:integer;
			suma_monto_total:real;
			vm:vector_motivo;
		begin
			cant_trans:=0;
			while (l <> nil) do begin
				if (l^.dato.num_cuenta_origen <> l^.dato.num_cuenta_destino) then begin
					cargarordenado(l_terce, l^.dato);
					actual:=l^.dato.num_cuenta_origen;
					suma_monto_total:=0;
					while (l <> nil) and (actual = l^.dato.num_cuenta_origen) do begin
						suma_monto_total:=suma_monto_total+l^.dato.monto;
						vm[l^.dato.cod_motivo_transfer]:=vm[l^.dato.cod_motivo_transfer]+1;
						if (l^.dato.fecha.mes = 6) and (digito_pares(l^.dato.num_cuenta_destino) = true) then
							cant_trans:=cant_trans+1;
					end;
					writeln('cada cuenta de origen el monto total transferido a terceros, ',l^.dato.monto);
				end;	
				l:=l^.sig;
			end;
			writeln('el codigo de motivo que más transferencias a terceros tuvo es ',cuentamotivo(vm));	 //tira 6 no se porque -.-
			write('la cantidad de transferencias a terceros realizadas en el mes de Junio en las');
			writeln( 'cuales el número de cuenta destino posea menos dígitos pares que impares ', cant_trans);			
		end;
	
	var
		l, l_terce:lista;
		vm:vector_motivo;
	begin
		l:=nil;
		l_terce:=nil;
		cargarvector(vm);
		//cargatranfer(l); se dispone
		recorrerlista(l);
		readln;
	
	end.