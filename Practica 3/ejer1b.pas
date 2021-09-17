program Registros;
type
	str20 = string[20];

	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

procedure leer(var alu : alumno);
	begin
		writeln('Ingrese el codigo del alumno');
		readln(alu.codigo);
			if (alu.codigo <> 0) then begin
				writeln('Ingrese el nombre del alumno'); 
				readln(alu.nombre);
				writeln('Ingrese el promedio del alumno'); 
				readln(alu.promedio);
			end;
	end;
procedure promedio	(a:alumno; var promedio_max:real; var promedio_nombre:string);
	begin
		if (a.promedio > promedio_max) then begin
			promedio_max:=a.promedio;
			promedio_nombre:=a.nombre;

		end;
	end;

var
a : alumno;
cant:integer;
promedio_nombre:string[20];
promedio_max:real;
begin
	promedio_max:=0;
	cant:=0;
	leer(a);
		while (a.codigo <> 0) do begin
			promedio(a, promedio_max, promedio_nombre);
			cant:=cant+1;
			leer(a);
		end;
	writeln('La cantidad de alumnos leidos es ',cant);	
	writeln('El nombre del alumno con mejor promedio es ', promedio_nombre);
readln();
end.
