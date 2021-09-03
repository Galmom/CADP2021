program ejer;
var
	codigo:integer;
	precio_act, precio_nue, promedio, variable:real;
begin
	promedio:=0;
	variable:=0;
	repeat
		writeln('Ingrese el codigo, el precio actual y el nuevo precio del producto');
		readln(codigo);
		readln(precio_act);
		readln(precio_nue);
		promedio:=precio_nue*100/precio_act;{tambien es puedo multiplicar 1.1 que da el 10%}
		variable:=promedio-100;
		if (variable <=10) then
			writeln('El aumento de precio del producto ',codigo,' no supera el 10%')
		else
			writeln('El aumento de precio del producto ',codigo,' es superior al 10%');
	until(codigo = 32767);
	readln();
end.
