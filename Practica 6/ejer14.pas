{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a 
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por 
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 
y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo 
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más 
de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de 
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program ejer;
type
	string20=string[20];
	marzo=1..30;
	viaje=record
		codigo_alu:integer;
		dia:marzo;
		facultad_perte:string20;
		medio_transpo:1..5;
		end;

	lista=^nodo;

	nodo=record
		dato:viaje;
		sig:lista;
		end;

	vector_alu=array[1..1300] of viaje;// se dispone
	
	mt_vector=array[1..5] of integer;
	
	procedure cargatransporte(var vt:mt_vector);
		var
			i:integer;
		begin
			for i:=1 to 5 do
				vt[1]:=0;
		end;		

	procedure leer(var v:viaje);
		begin
			writeln('Ingrese el codigo alumno');
			readln(v.codigo_alu);
			if (v.codigo_alu <> -1) then begin
				writeln('Ingrese la fecha');
				readln(v.dia);
				writeln('Ingrese la Facultada la que pertenece');
				readln(v.facultad_perte);
				writeln('Ingrese el medio de transporte');
				readln(v.medio_transpo);
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

	procedure cargar(var l:lista);
		var
			v:viaje;
		begin
			leer(v);
			while (v.codigo_alu <> -1) do begin
				agregaradelante(l, v);
				leer(v);
			end;
		end;	
	procedure transporte_utilizado_max(vt:mt_vector; var max1, max2, trans2, trans1:integer);
		var
			i:integer;
		begin
			for i:=1 to 5 do begin
				if (vt[i] > max1) then begin
					max2:=max1;
					trans2:=trans1;
					max1:=vt[i];
					trans1:=1;
				end
				else
					if (vt[i] > max2) then begin
						max2:=vt[i];
						trans2:=i;
				end;				
			end;
		end;

	procedure recorrerlista(l:lista; vt:mt_vector);
		var
			actual_dia, actual_alum, cant_viaje, cant_6_dias, cant_gasto_mas_80, supero:integer;
			max2, max1, trans2, trans1:integer;
			cant_gasto_dia:real;
		begin
			max1:=-1;
			max2:=-1;
			actual_dia:=0; 
			actual_alum:=0; 
			cant_6_dias:=0;
			while (l <> nil) do begin
				actual_alum:=l^.dato.codigo_alu;
				while (l <> nil) and (l^.dato.codigo_alu = actual_alum) do begin
					actual_dia:=l^.dato.dia;
					cant_viaje:=0;
					cant_gasto_mas_80:=0;
					cant_gasto_dia:=0;
					supero:=0;
					while (l <> nil) and (l^.dato.codigo_alu = actual_alum) and (l^.dato.dia = actual_dia) do begin
						cant_viaje:=cant_viaje+1;
						cant_gasto_dia:=cant_gasto_dia+l^.dato.medio_transpo;
						if (cant_gasto_dia > 80) and (supero <> 1) then
							supero:=supero+1;
							cant_gasto_mas_80:=cant_gasto_mas_80+1;
						if ( cant_viaje = 7) then
						 	cant_6_dias:=cant_6_dias+1;	
						vt[l^.dato.medio_transpo]:= vt[l^.dato.medio_transpo]+1;
					l:=l^.sig;
					end;
				end;
			end;
			transporte_utilizado_max(vt, max1, max2, trans2, trans1);
			writeln('Los dos medios de transporte mas utilizados es ',trans1,' y ', trans2 );
			writeln('La cantidad de alumnos que gastan en transporte mas de $80 por dia es ', cant_gasto_mas_80); 
			writeln('La cantidad de alumnos que realizan mas de 6 viajes por dia es ', cant_6_dias);
		end;

	var
		l:lista;
		vt:mt_vector;
		vu:vector_alu;
	begin
		l:=nil;
		//cargaVector(vu);//dispone
		cargatransporte(vt);
		cargar(l);
		recorrerlista(l, vt);
		readln;
	end.