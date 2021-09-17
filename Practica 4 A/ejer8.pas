{
8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

program ejer;
const
	max400=3;
type
	rango=1..max400;
	string20=string[20];
	alumno=record
		nro_inscripcion:string20;
		dni:integer;
		apellido:string20;
		nombre:string20;
		anio_nacimiento:integer;
	end;
	vector=array [rango] of alumno;

	procedure alumnado(var a:alumno);
		begin
			writeln('Ingresa el nro de inscripcion, DNI, apellido, nombre y anio de nacimiento');
			readln(a.nro_inscripcion);
			readln(a.dni);
			readln(a.apellido);
			readln(a.nombre);
			readln(a.anio_nacimiento);
		end;

	procedure cargar(var a:vector);
		var
			i:integer;
		begin
			for i:=1 to max400 do begin
				alumnado(a[i]);
			end;
		end;

	procedure pares(a:vector; var cant:integer);
		var
			i, aux, dig, cant_impar, cant_par:integer;
		begin
			dig:=0;
			aux:=0;
			cant_impar:=0;
			cant_par:=0;
			for i:=1 to max400 do begin
				aux:=a[i].dni;
				while (aux <> 0) and (cant_impar = 0) do begin
         			dig:= aux MOD 10;
	     			if (dig mod 2 = 0) then
	     				cant_par:=cant_par+1
	     			else
	     				cant_impar:=cant_impar+1;	
		 			aux:= aux DIV 10;
	 			end;
	 			if (cant_impar = 0) then
	 				cant:=cant+1;
	 			cant_impar:=0;
				cant_par:=0;	
			end;
		end;

	procedure mayor(a:vector; var max_nombre1, max_apellido1, max_nombre2, max_apellido2:string);
		var
			max1, max2, i:integer;
		begin
			max1:=9999;
			max2:=9999;
			for i:=1 to max400 do begin
				if (a[i].anio_nacimiento < max1) then begin
					max2:=max1;
					max_nombre2:=max_nombre1;
					max_apellido2:=max_apellido1;
					max1:=a[i].anio_nacimiento;
					max_nombre1:=a[i].nombre;
					max_apellido1:=a[i].apellido;
				end
				else if (a[i].anio_nacimiento < max2) then begin
					max2:=a[i].anio_nacimiento;
					max_nombre2:=a[i].nombre;
					max_apellido2:=a[i].apellido;
				end;
			end;
		end;	

	// procedure imprimir(a:vector);
	// 	var
	// 		i:integer;
	// 	begin
	// 		for i:=1 to max400 do begin
	// 			writeln('sadasda ' ,a[i].nro_inscripcion );
	// 			writeln('sadasda ' ,a[i].dni);
	// 			writeln('sadasda ' ,a[i].apellido);
	// 			writeln('sadasda ' ,a[i].nombre);
	// 			writeln('sadasda ' ,a[i].anio_nacimiento);
	// 			end;
	// 	end;	

	var
		alumnos:vector;
		alu:alumno;
		cant:integer;
		max_nombre1, max_apellido1, max_nombre2, max_apellido2:string20;
	begin
		cant:=0;
		cargar(alumnos);
		pares(alumnos, cant);
		mayor(alumnos, max_nombre1, max_apellido1, max_nombre2, max_apellido2);
		writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares ',cant);
		writeln('Apellido y nombre de los dos alumnos de mayor edad. ', max_nombre1,' ',max_apellido1,' y ',max_nombre2,' ', max_apellido2);
		// imprimir(alumnos);
		readln();
	end.