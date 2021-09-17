{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.}

program ejer;
type
	string20=string[20];
	rango=1..7;

	objeto=record
		cod_objeto:integer;
		cate_objeto:rango;
		nombre_objeto:string20;
		distancia_tierra:real;
		nombre_descubridor:string20;
		anio_descubierto:integer;
		end;

	lista=^nodo;

	nodo=record
		dato:objeto;
		sig:lista;
		end;

	vector_galaxia=array[rango] of integer;

	procedure cargarvector(var vg:vector_galaxia);
		var
			i:rango;
		begin
			for i:=1 to 7 do
				vg[i]:=0;
		end;

	procedure leer(var ob:objeto);
		begin
			writeln('ingrese el codigo del objeto');
			readln(ob.cod_objeto);
			if (ob.cod_objeto <> -1) then begin
				writeln('ingrese la categoria del objeto');
				readln(ob.cate_objeto);
				writeln('ingrese el nombre del objeto');
				readln(ob.nombre_objeto);
				writeln('ingrese la distancia a la tierra');
				readln(ob.distancia_tierra);
				writeln('ingrese el nombre del descubridor');
				readln(ob.nombre_descubridor);
				writeln('ingrese el anio descubierto');
				readln(ob.anio_descubierto);
			end;
		end;

	procedure agregaradelante(var l:lista; ob:objeto);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=ob;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);	
		var
			ob:objeto;
		begin
			leer(ob);
			while (ob.cod_objeto <> -1) do begin
				agregaradelante(l, ob);
				leer(ob);
			end;
		end;





	procedure maximo(cod_objeto:integer; distancia_tierra:real; var max1, max2:real; var cod1, cod2:integer);
		begin
			if (distancia_tierra > max1) then begin
				max2:=max1;
				cod2:=cod1;
				max1:=distancia_tierra;
				cod1:=cod_objeto;
			end
			else
				if (distancia_tierra > max2) then begin
					max2:=distancia_tierra;
					cod2:=cod_objeto;
				end;	
		end;

	function par_impar(cod_objeto:integer):boolean;
		var
			cant_par, cant_impar, digito:integer;
		begin
			digito:=0;
			cant_par:=0;
			cant_impar:=0;
			while (cod_objeto <> 0) do begin
				digito:=cod_objeto mod 10;
				if (digito mod 2 = 0) then
					cant_par:=cant_par+1
				else
					cant_impar:=cant_impar+1;
				cod_objeto:=cod_objeto div 10;	
			end;
				if (cant_par > cant_impar) then
					par_impar:=true
				else
					par_impar:=false;	
		end;

	procedure recorrer(l:lista; vg:vector_galaxia);
		var
			max1, max2:real;
			cod1, cod2, cant_planeta, i:integer;
		begin
			max1:=-1;
			max2:=0;
			cod1:=0;
			cod2:=0;
			cant_planeta:=0;
			while (l <> nil) do begin
				maximo(l^.dato.cod_objeto, l^.dato.distancia_tierra, max1, max2, cod1, cod2);
				if (l^.dato.nombre_objeto = 'Galileo Galilei') and (l^.dato.anio_descubierto < 1600) then
					cant_planeta:=cant_planeta+1;
				vg[l^.dato.cate_objeto]:=vg[l^.dato.cate_objeto]+1;
				if (par_impar(l^.dato.cod_objeto) = true) then
					writeln('el nombre de la estrella cuyo código de objeto poseen más dígitos pares que impares',l^.dato.nombre_objeto);
				l:=l^.sig;
			end;
			writeln('los códigos de los dos objetos más lejanos de la tierra que se hayan observado.',cod1,' y ',cod2);
			writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.', cant_planeta);
			for i:=1 to 7 do
				writeln('La cantidad de objetos observados por cada categoría.',i,' es ',vg[i]);
		end;

	var
		l:lista;
		vg:vector_galaxia;
	begin
		l:=nil;
		cargarvector(vg);
		cargarlista(l);
		recorrer(l, vg);
	end.