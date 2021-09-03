program ejer;
var
	num_legajo, cant_alum, cont_max:integer;
	promedio, promedio_max, porcen_destacados:real;
begin
	cant_alum:=0;
	cont_max:=0;
	promedio_max:=0;
	porcen_destacados:=0;
	writeln('Ingrese el numero de legajo y el promedio');
	readln(num_legajo);
	while (num_legajo <> -1) do begin
		readln(promedio);
		cant_alum:=cant_alum+1;
		writeln('Ingrese el numero de legajo y el promedio');
		readln(num_legajo);
		if (promedio > 6.5) then
			promedio_max:=promedio_max+1;
		if (promedio > 8.5) and (num_legajo < 2500) then
			cont_max:=cont_max+1;
	end;
	porcen_destacados:=cont_max*100/cant_alum;
	writeln('La cantidad de alumnos es: ', cant_alum);
	writeln('La cantidad de alumnos cuyo promedio supera 6.5 es ', promedio_max:2:2);
	writeln('El porcentaje de alumnos destacados es: ' , porcen_destacados:2:2);
	readln();
end.
