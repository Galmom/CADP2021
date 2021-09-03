program ejer;
var
	num, min1, min2, suma:integer;
begin
	suma:=0;
	min1:=-1;
	min2:=999;
	repeat
		writeln('Ingrese un numero');
		readln(num);
			if (num > min1) then
				min1:=num;	
			if (num < min2) then
				min2:=num;
		suma:=suma+num;
	until (num = 100);
	writeln('El numero maximo leido es ', min1);	
	writeln('El numero minimo leido es ', min2);
	writeln('La suma de los numeros leidos es ', suma);
readln();
end.