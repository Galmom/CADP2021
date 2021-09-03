program ejer;
var
	nombre:string[20];
	modulo, modulo_max, modulo_7:integer;
begin
	modulo:=0;
	modulo_7:=0;
	modulo_max:=0;
	repeat
		writeln('Ingrese el nombre y la nota del alumno del modulo EPA');
		readln(nombre);
		readln(modulo);
		if (modulo >= 8) then
			modulo_max:=modulo_max+1
		else	
		if (modulo = 7) then
			modulo_7:=modulo_7+1;	 
	until(nombre = 'zidane zinedine');	
	write('La cantidad de alumnos aprobados con 8 es ', modulo_max);
	writeln(' y la cantidad de alumnos que obtuvieron un 7 como nota es ', modulo_7);
readln();
end.