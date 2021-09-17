{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.
}
program ejer;

type
	string20=string[20];
	rango=1..20;

	variacion=record
		tipo_cultivo:string20;
		cant_hc:integer;
		cant_meses:integer;
		end;

vector_cultivo=array[rango] of variacion;

	empresa=record
		codigo:integer;
		nombre:string20;
		estatal:string20;
		ciudad_radica:string20;
		cultivo:vector_cultivo;
		diml:integer;
		end;

	lista=^nodo;

	nodo=record
		dato:empresa;
		sig:lista;
		end;


	procedure leer2(var v:variacion; var vc:vector_cultivo; var i:integer);
		begin
			writeln('Ingresar la cantidad de hc');
			readln(v.cant_hc);
			while (v.cant_hc <> 0) and (i < 20) do begin
				writeln('Ingresar el tipo cultivo');
				readln(v.tipo_cultivo);
				writeln('Ingresar la cantidad de meses');
				readln(v.cant_meses);
				vc[i]:=v;
				i:=i+1;
				writeln('Ingresar la cantidad de hc');
				readln(v.cant_hc);
			end;
		end;
	
	procedure leer(var e:empresa);
		var
			i:integer;
			v:variacion;
		begin
			i:=1;
			writeln('Ingresar el codigo de la empresa');
			readln(e.codigo);
			if (e.codigo <> -1) then begin
				writeln('Ingresar el nombre de la empresa');
				readln(e.nombre);
				writeln('Ingresar si es estatal o privado');
				readln(e.estatal);
				leer2(v, e.cultivo, i);//mando el otro registro, el vector y diml=i
				e.diml:=i;
			end;	
		end;

	procedure agregaradelante(var l:lista; e:empresa);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=e;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);
		var
			e:empresa;
		begin
			leer(e);
			while (e.codigo <> -1) do begin
				agregaradelante(l, e);
				leer(e);
			end;	
		end;

	function ceros(cod:integer):integer;
		var
			contador, digito:integer;
		begin
			contador:=0;
			digito:=0;
			while (cod <> 0) and (contador < 2) do begin
				digito:=cod mod 10;
				if (digito = 0) then 
					contador:=contador+1;
				cod:=cod div 10;	
			end;
			ceros:=contador;
		end;

	procedure maximo(vc:vector_cultivo; diml:integer; var max:integer; var nombre_max:string; nombre:string);
		var
			i:integer;
		begin
			for i:=1 to diml do begin
				if (vc[i].cant_meses > max) then begin
					max:=vc[i].cant_meses;
					nombre_max:=nombre;
				end;
			end;
		end;
	function buscar(vc:vector_cultivo; diml:integer; elemento:string):integer;
		var
			exito:boolean;
			pos:integer;
		begin
			pos:=1;
			exito:=false;
			while (exito = false) and ( pos <= diml) do begin
				if (elemento = vc[pos].tipo_cultivo) then
					exito:=true
				else
					pos:=pos+1;
			end;
			if (exito = false) then
				pos:=0;
			buscar:=pos;	 				

		end;

{Una vez leída y almacenada la información, calcular e informar:
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}
	function suma_hc(diml:integer; vc:vector_cultivo):integer;
		var
			i, suma:integer;
		begin
			suma:=0;
			for i:=1 to diml do
				suma:=suma+vc[i].cant_hc;
			suma_hc:=suma;	
		end;
	procedure incremento(var l:lista);
		var
			elemento:string;
			posicion:integer;
		begin
			while (l <> nil) do begin
				posicion:=0;
				elemento:='girasol';
				posicion:=buscar(l^.dato.cultivo, l^.dato.diml, elemento);
					if (posicion <> 0) and (l^.dato.cultivo[posicion].cant_hc < 5) and (l^.dato.estatal = 'no') then
						l^.dato.cultivo[posicion].cant_meses:=l^.dato.cultivo[posicion].cant_meses+1;
			end;	
		end;
			
	procedure recorrer(l:lista);
		var
			i, cant_hc_soja, total_hc, posicion, max:integer;
			elemento, nombre_max:string;
			porcentaje:real;
		begin
			porcentaje:=0;
			posicion:=0;
			max:=0;
			while (l <> nil) do begin
				elemento:='trigo';
				total_hc:=0;
				total_hc:=total_hc+suma_hc(l^.dato.diml, l^.dato.cultivo);
				if (l^.dato.ciudad_radica = 'san miguel') and (buscar(l^.dato.cultivo, l^.dato.diml, elemento) <> 0) and (ceros(l^.dato.codigo) > 1) then begin
					write('el Nombre de las empresas radicadas en “San Miguel del Monte” que cultivan');
					writeln(' trigo y cuyo código de empresa posee al menos dos ceros.', l^.dato.nombre);
				end;
				elemento:='soja';
				posicion:=buscar(l^.dato.cultivo, l^.dato.diml, elemento);
				if  (posicion <> 0)then	begin
					cant_hc_soja:=cant_hc_soja + l^.dato.cultivo[posicion].cant_hc ;
				end;
				porcentaje:=cant_hc_soja*100/total_hc;
				write('La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje ');
				writeln('representa con respecto al total de hectáreas.',cant_hc_soja,' y el % ', porcentaje:4:2);
				elemento:='maiz';
				if (buscar(l^.dato.cultivo, l^.dato.diml, elemento) <> 0) then
					maximo(l^.dato.cultivo, l^.dato.diml,max, nombre_max, l^.dato.nombre);
				l:=l^.sig;
			end;
				writeln('La empresa que dedica más tiempo al cultivo de maíz', nombre_max);
		end;

	var
		l:lista;
	begin
		l:=nil;
		cargarlista(l);
		recorrer(l);
		incremento(l);
		readln;
	end.	