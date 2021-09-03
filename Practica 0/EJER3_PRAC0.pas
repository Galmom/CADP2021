program ejer1;
const
	pi=3.14;
var
	num1, area, radio:real;
begin
	radio:=0;
	area:=0;
	writeln('ingrese diametro del circulo');
	readln(num1);
	radio:= num1/2;
	area:=pi*num1;
	writeln('El radio es ', radio:2:2);
	writeln('El area del circulo es: ', area:2:2);
	readln();
end.