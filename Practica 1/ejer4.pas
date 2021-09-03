program ejer;
var
	num,num1:integer;
begin{tambien puede ser hacer un num2 que sea un numero que ingresamos
y ahi que saque el doble, num2 lo ingrese por teclado}
	num1:=0;
	num:=60;
	writeln('Ingrese un numero');
	readln(num1);
	while (num1 <> (num*2)) do begin
		readln(num1);
	end;
	writeln('El numero leido es el doble que 60');
	readln();
end.
