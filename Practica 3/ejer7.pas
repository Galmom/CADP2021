{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}
program ejer;
type
	string20=string[20];

	datos=record
		nombre:string20;{(ej. LIDI, LIFIA, LINTI)}
		universidad:string20;
		cant_investi:integer;
		cant_becario:integer;
	end;

	procedure cargar(var c:datos);
		begin
			write('Ingrese la cantidad de investigadores, la universidad a la que pertenece, ');
			writeln('el centro de investigacion y de becarios que poseen');
			readln(c.cant_investi);
			if (c.cant_investi <> 0) then begin
				readln(c.universidad);
				readln(c.nombre);
				readln(c.cant_becario);
			end;	
		end;

	procedure maximo(c:datos; var max1:integer; var univer1:string20);
		begin
			if (c.cant_investi > max1) then begin
				max1:=c.cant_investi;
				univer1:=c.universidad;
			end;	
		end;

	procedure minimo(c:datos; var min1, min2:integer; var centro1, centro2:string20);
		begin
			if (c.cant_becario < min1) then begin
				min2:=min1;
				centro2:=centro1;
				min1:=c.cant_becario;
				centro1:=c.nombre;
			end
			else if (c.cant_becario < min2) then begin
				min2:=c.cant_becario;
				centro2:=c.nombre;;
			end;
		end;	

	var
		centro:datos;
		actual, univer1,centro1, centro2:string20;
		cantidad_centro, max1,min1, min2:integer;
	begin
	max1:=0;
	min1:=9999;
	min2:=9999;
	cargar(centro);
	actual:=centro.universidad;
	while (centro.cant_investi <> 0) and (centro.universidad = actual) do begin
		maximo(centro, max1, univer1);
		minimo(centro,min1, min2, centro1, centro2);
		cantidad_centro:=cantidad_centro+1;
		cargar(centro);
		if (centro.universidad <> actual) then begin
			writeln('La cantidad total de centros para la universidad ', actual,' es ', cantidad_centro);
			actual:=centro.universidad;
			cantidad_centro:=0;
		end;
	end;
	writeln('La Universidad con mayor cantidad de investigadores en sus centros es ',univer1);
	writeln('Los dos centros con menor cantidad de becarios es ',centro1,' y ',centro2);
	readln();
	end.