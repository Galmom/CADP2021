{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}
program ejer;
	
type
	string20=string[20];

	escuela=record
		cue:integer;
		nombre_establecimiento:string20;
		cant_docente:integer;
		cant_alumnos:integer;
		localidad:string20;
	end;
procedure carga(var e:escuela);
	begin
		writeln('Ingrese el CUE, nombre del establecimiento, cantidad de docentes, cantidad de alumnos y la localidad');
		readln(e.cue);
		readln(e.nombre_establecimiento);
		readln(e.cant_docente);
		readln(e.cant_alumnos);
		readln(e.localidad);
	end;

function relacion(e:escuela):integer;
	var
		cuenta:real;
	begin
		cuenta:=e.cant_alumnos/e.cant_docente;
		if (e.localidad = 'la plata') and (  cuenta > 23.435) then
			relacion:=1
		else
			relacion:=0;	
	end;

procedure mejor_relacion(e:escuela; var escu1, escu2:string; var cue1, cue2:integer);
	begin
		if (relacion(e) > cue1) then begin
			cue2:=cue1;
			escu2:=escu1;
			cue1:=e.cue;
			escu1:=e.nombre_establecimiento;
		end
		else if (relacion(e) > cue2) then begin
			cue2:=e.cue;
			escu2:=e.nombre_establecimiento;
		end;
	end;	

var
	i, cant_escuelas_CUE, cue1, cue2:integer;
	establecimiento:escuela;
	escu1, escu2:string20;
begin
	cue1:=24;
	cue2:=24;
	escu1:='';
	escu2:='';
	i:=0;
	cant_escuelas_CUE:=0;
	for i:=1 to 4 do begin{va 2400 en 4}
		carga(establecimiento);
		cant_escuelas_CUE:=cant_escuelas_CUE+(relacion(establecimiento));
		mejor_relacion(establecimiento, escu1, escu2, cue1, cue2);
	end;
	writeln('La Cantidad de escuelas de La Plata con una relacion alumnos/docente superior a la sugerida por UNESCO es ', cant_escuelas_CUE);
	writeln('La CUE y nombre de las dos escuelas con mejor relacion docentes/alumnos es ', cue1,' ',escu1, ' y ', cue2,' ',escu2);
	readln();
	end.