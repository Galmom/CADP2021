program ejer;
procedure minimos(nro_inscripcion:integer; apellido:string;var min_incrip1, min_incrip2:integer; var apellido1, apellido2:string);
	begin
		if (nro_inscripcion < min_incrip1) then begin
				min_incrip2:=min_incrip1;
				apellido2:=apellido1;
				min_incrip1:=nro_inscripcion;
				apellido1:=apellido;
		end
		else if (nro_inscripcion < min_incrip2) then begin
				min_incrip2:=nro_inscripcion;
				apellido2:=apellido;
		end;
	end;
procedure maximos(nro_inscripcion:integer; nombre:string; var max_incrip1, max_incrip2:integer; var nombre1, nombre2:string);
	begin
		if (nro_inscripcion > max_incrip1) then begin
			max_incrip2:=max_incrip1;
			nombre2:=nombre1;
			max_incrip1:=nro_inscripcion;
			nombre1:=nombre;
		end
		else if (nro_inscripcion > max_incrip2) then begin
			max_incrip2:=nro_inscripcion;
			nombre2:=nombre2;
		end;
	end;
function pares(nro_inscripcion:integer):boolean;		
	begin
		if (nro_inscripcion mod 2 = 0) then
			pares:=true
		else
			pares:=false;	
	end;
var
	nro_inscripcion, min_incrip1, min_incrip2, max_incrip1, max_incrip2, par,can_alumnos:integer;
	apellido, apellido1, apellido2, nombre, nombre1, nombre2:string[20];
	porcentaje:real;	
begin
	min_incrip1:=9999;
	min_incrip2:=9999;
	max_incrip1:=-1;
	max_incrip2:=-1;
	par:=0;
	can_alumnos:=0;
	repeat
		writeln('Ingrese Nro de inscripcion, apellido y nombre');
		readln(nro_inscripcion);
		readln(apellido);
		readln(nombre);
		can_alumnos:=can_alumnos+1;
		minimos(nro_inscripcion, apellido, min_incrip1, min_incrip2, apellido1, apellido2);
		maximos(nro_inscripcion, nombre, max_incrip1, max_incrip2, nombre1, nombre2);
		if (pares(nro_inscripcion)) then begin
			par:=par+1;
		end;
	until(nro_inscripcion = 1200);
	porcentaje:=par*100/can_alumnos;
	writeln('Los Apellido de los dos alumnos con nro de inscripcion mas chico es, ',apellido1, ' y ', apellido2);
	writeln('Los Nombre de los dos alumnos con nro de inscripcion mas grande es, ',nombre1, ' y ', nombre2);
	writeln('Los Porcentaje de alumnos con nro de inscripcion par es ',porcentaje:3:3);
	
	readln();
end.