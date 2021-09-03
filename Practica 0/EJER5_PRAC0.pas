program ejer;
var
	can1, can2:integer;
	divi, kios, precio:real;
begin
	precio:=0;
	kios:=0;
	divi:=0;
	writeln('Ingrese la cantidad de caramelos del kioquero');
	readln(can1);
	writeln('Ingrese la cantidad de clientes');
	readln(can2);
	divi:=can1 div can2;
	precio:=1.6*divi*can2;
	kios:= can1 mod can2;
	writeln('A cada cliente le corresponde ', divi:2:2 , ' y al kiokero ', kios:2:2);
	writeln('Tienen que abonar :' ,precio:2:2);
 readln();
end.