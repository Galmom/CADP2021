{9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: 
localidad, apellido del candidato, cantidad de votos obtenidos y cantidad de votantes de la localidad. 

La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}
program ejer;
type
	string20=string[20];

	persona=record
		localidad:string20;
		apellido:string20;
		votos_obte:integer;
		votantes_x_localidad:integer;
	end;

procedure cargar(var p:persona);
	begin
		write('Ingrese la localidad, apellido del candidato, cantidad de votos'); {cada candidato}
		writeln(' obtenidos y cantidad de votantes de la localidad.');
		readln(p.localidad);
		if (p.localidad <> 'zarate') then begin
			readln(p.apellido);
			readln(p.votos_obte);
			readln(p.votantes_x_localidad);
		end;
	end;

	procedure max_voto(p:persona; var apellido:string20; var max1:integer);
		begin
			if (p.votos_obte > max1) then begin
				max1:=p.votos_obte;
				apellido:=p.apellido;
			end;	
		end;

	function porcentaje(p:persona):real;
		begin
			porcentaje:=p.votos_obte*100/p.votantes_x_localidad;
		end;

	procedure max_porcentaje(p:persona; var ape_porcentaje:string20; var porcentaje_max:real);
		var
			a:real;
		begin
			a:=porcentaje(p);
			writeln(a:4:4);
			if (a > porcentaje_max) then begin
				porcentaje_max:=a;	
				ape_porcentaje:=p.apellido;
			end;	
		end;

	var
		candidato:persona;
		apellido, ape_porcentaje:string20;
		max1:integer;
		porcentaje_max:real;
	begin
		porcentaje_max:=0;
		max1:=0;
	repeat
		cargar(candidato);
		max_voto(candidato, apellido, max1);
		max_porcentaje(candidato, ape_porcentaje, porcentaje_max);
	until (candidato.localidad = 'zarate');
	writeln('El intendente que obtuvo la mayor cantidad de votos en la eleccion es ', apellido);
	writeln('El intendente que obtuvo el mayor porcentaje de votos de la eleccion es ', ape_porcentaje);
	readln();
	end.