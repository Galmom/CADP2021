{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas 
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad 
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del 
espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías: 
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al 
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.}

program ejer;
type
	string20=string[20];
	rango=1..7;

	sonda=record
		nombre:string20;
		duracion_mision:integer;
		costo_construc:real;
		costo_mante_mensual:real;
		rango_espectro:rango;
		end;

	lista=^nodo;

	nodo=record
		dato:sonda;
		sig:lista;
		end;

	v_contador=array [rango] of integer;

	procedure carga_vector(var vc:v_contador);
		var
			i:rango;
		begin
			for i:=1 to 7 do begin
				vc[i]:=0;
			end;
		end;

	procedure leer_sonda(var s:sonda);
		begin
			writeln('Ingrese el nombre');
			readln(s.nombre);
			writeln('Ingrese la duracion de la mision');
			readln(s.duracion_mision);
			writeln('Ingrese el costo de construccion');
			readln(s.costo_construc);
			writeln('Ingrese el costo de mantenimiento');
			readln(s.costo_mante_mensual);
			writeln('Ingrese el rango_espectro');
			readln(s. rango_espectro);
		end;

	procedure agregaradelante(var m:lista; s:sonda);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=s;
			nue^.sig:=m;
			m:=nue;
		end;

	procedure carga(var m:lista; var cant_sondas, suma_total:integer; var suma_construccion:real);
		var
			s:sonda;
		begin
			repeat
				leer_sonda(s);//lo puse abajo (estaban al reves) y no andaba... porque?
				agregaradelante(m, s);
				cant_sondas:=cant_sondas+1;
				suma_total:=suma_total+m^.dato.duracion_mision;
				suma_construccion:=suma_construccion+m^.dato.costo_construc;
			until (s.nombre = 'gaia');
		end;

	procedure sonda_costo_max(costo_construc, costo_mante_mensual:real; nombre:string; var nombre_costo:string; var max1:real);
		var
			suma:real;
		begin
			suma:=0;
			suma:=costo_construc+costo_mante_mensual;
			if (suma > max1) then begin
				max1:=suma;
				nombre_costo:=nombre;
			end;	
		end;
	
	procedure vector_espectro(var vc:v_contador; rango:integer);
		begin
			vc[rango]:=vc[rango]+1;
		end;

	function estimacion_promedio(m:lista; promedio:real):integer;
		begin
			if (m^.dato.duracion_mision > promedio) then
				estimacion_promedio:=1
			else
				estimacion_promedio:=0;	
		end;	

	procedure costo_construcion(costo_construc, prom_cons:real; nombre:string);
		begin
			if (costo_construc > prom_cons) then
				writeln('El nombre de las sonda cuyo costo de construccion supera el costo promedio entre todas las sondas es ', nombre);
		end;

	procedure recorrer(m:lista; var vc:v_contador; cant_sondas, suma_total:integer; suma_construccion:real);
		var
			max1, promedio, prome_construccion:real;
			nombre_costo:string20;
			i, rango_espectro, cant_superacion_tiempo:integer;
		begin
			prome_construccion:=0;
			cant_superacion_tiempo:=0;
			promedio:=0;
			i:=0;
			max1:=-1;
			promedio:=suma_total/cant_sondas;
			prome_construccion:=suma_construccion/cant_sondas;
			while (m <> nil) do begin
				sonda_costo_max(m^.dato.costo_construc, m^.dato.costo_mante_mensual, m^.dato.nombre, nombre_costo, max1);
				vector_espectro(vc, m^.dato.rango_espectro);
				cant_superacion_tiempo:=cant_superacion_tiempo+estimacion_promedio(m, promedio);
				costo_construcion(m^.dato.costo_construc, prome_construccion, m^.dato.nombre);
				m:=m^.sig;
			end;
			writeln('El nombre de la sonda mas costosa es ', nombre_costo);
			writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es ',cant_superacion_tiempo);
			for i:=1 to 7 do begin
				WriteLn('En la posicion ',i,' se contaron ',vc[i],' veces ');
			end;	
		end;

	procedure imprimir(m:lista);
		begin
			while (m <> nil) do begin
				writeln(m^.dato.costo_construc);
				m:=m^.sig;
			end;	
		end;

var
	mision:lista;
	vc:v_contador;
	cant_sondas, suma_total:integer;
	suma_construccion:real;
begin
	suma_construccion:=0;
	cant_sondas:=0;
	suma_total:=0;
	mision:=nil;
	carga_vector(vc);
	carga(mision, cant_sondas, suma_total, suma_construccion);
	recorrer(mision, vc, cant_sondas, suma_total, suma_construccion);
	//imprimir(mision);
	readln();
end.