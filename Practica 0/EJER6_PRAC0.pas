program ejer;
var
	num1, num2, num3, comision,cambio,total:real;
begin
	cambio:=0;
	comision:=0;
	total:=0;
	writeln('Ingrese el monto de la transaccion ');
	readln(num1);
	writeln('Ingrese el valor del dolar del dia');
	readln(num2);
	writeln('Ingrese la comision del banco');
	readln(num3);
	cambio:=num1*num2;
	comision:=cambio*num3/100;
	total:=cambio+comision;
	writeln('La transaccion sera de ', total:2:2, ' pesos argentinos');		
 	readln();
end.