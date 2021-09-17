{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program ejer;
type
	rango=1..100;
	string20=string[20];

	camion=record
		patente:integer;
		anio_fabricacion:integer;
		capacidad_tn:real;
		end;

	vector_flota=array[rango] of camion;
	
	viaje=record
		cod_viaje:integer;
		cod_camion:rango;
		km_recorrido:real;
		ciudad_destino:string20;
		anio_viaje:integer;
		dni_chofer:integer;
		end;

	lista=^nodo;

	nodo=record
		dato:viaje;
		sig:lista;
		end;

	procedure leer(var v:viaje);
		begin	
			writeln('Ingrese el codigo del viaje');
			readln(v.cod_viaje);
			if (v.cod_viaje <> -1) then begin
				writeln('Ingrese el codigo del camion');
				readln(v.cod_camion);
				writeln('Ingrese los km recorridos');
				readln(v.km_recorrido);
				writeln('Ingrese la ciudad destino');
				readln(v.ciudad_destino);
				writeln('Ingrese el anio del viaje');
				readln(v.anio_viaje);
				writeln('Ingrese el dni del chofer');
				readln(v.dni_chofer);
			end;
		end;

	procedure agregaradelante(var l:lista; v:viaje);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=v;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);
		var
			v:viaje;
		begin
			leer(v);
			while (v.cod_viaje <> -1) do begin
				agregaradelante(l, v);
				leer(v);
			end;

		end;

	procedure max_min(km:real; cod_camion:integer; vf:vector_flota; var max, min:real; var patente_max, patente_min:integer);
		begin
			if (km > max) then begin
				max:=km;
				patente_max:=vf[cod_camion].patente;
			end;
			if (km < min) then begin
				min:=km;
				patente_min:=vf[cod_camion].patente;
			end;
		end;

	function dni_digito_impares(dni_chofer:integer):boolean;
		var
			par:boolean;
			digito:integer;
		begin
			digito:=0;
			par:=false;
			while (dni_chofer <> 0) and (par = false) do begin
				digito:=dni_chofer mod 10;
				if (digito mod 2 = 0) then
					par:=true
				else
					dni_chofer:= dni_chofer div 10;	
			end;
				if (par = false) then
					dni_digito_impares:= true
				else
					dni_digito_impares:=false;	
		end;

	procedure recorrer(l:lista);
		var
			vf:vector_flota;
			patente_min, patente_max, cant_viajes:integer;
			max, min:real;
		begin
			cant_viajes:=0;
			max:=-1;
			min:=9999;
			patente_min:=0;
			patente_max:=0;
			while (l <> nil) do begin
				max_min(l^.dato.km_recorrido, l^.dato.cod_camion, vf, max, min, patente_max, patente_min);
				if (vf[l^.dato.cod_camion].capacidad_tn > 30.5) and ((vf[l^.dato.cod_camion].anio_fabricacion - l^.dato.anio_viaje) > 5) then
					cant_viajes:=cant_viajes+1;
				if (dni_digito_impares(l^.dato.dni_chofer) = true) then
					writeln('los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares' , l^.dato.cod_viaje);
				l:=l^.sig;
			end;
			writeln('la patente del camión que más kilómetros recorridos posee es', patente_max); 
			writeln('la patente del camión que menos kilómetros recorridos posee es ', patente_min);
			writeln('Inciso 2 muy largo...', cant_viajes);
		end;

	var
		l:lista;
	begin
		l:=nil;
		cargarlista(l);
		recorrer(l);
		readln;
	end.