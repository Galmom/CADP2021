program ejer1;
const
	pi=3.14;
var
	diam, area, radio,peri:real;
begin
	peri:=0;
	radio:=0;
	area:=0;
	writeln('ingrese diametro del circulo');
	readln(diam);
	radio:= diam/2;
	area:=pi*radio*radio;
	peri:=pi*radio*2;
	writeln('El radio es ', radio:2:2);
	writeln('El area del circulo es: ', area:2:2);
	writeln('El perimetro es: ',peri:2:2);
	readln();
end.