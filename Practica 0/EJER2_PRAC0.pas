program ejer1;
var
	num1, num2, suma:integer;
begin
	writeln('ingrese 2 numeros');
	readln(num1);
	readln(num2);
	suma:= num1 + num2;
	writeln('los suma con variable adicional de los numeros ingresadaos son: ', suma);
	writeln('los suma sin variable adicional de los numeros ingresadaos son: ', num1+num2);
	readln();
end.