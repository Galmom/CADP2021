program ejer;
var
	num,num1,cont:integer;
begin
	cont:=1;
	num:=60;
	num1:=0;
	writeln('Ingrese el ' , cont,' numero');
	readln(num1);
	while (num1 <> (num*2)) and (cont<=10) do begin
		cont:=cont+1;
		writeln('Ingrese el ' , cont,' numero');
		readln(num1);
	end;
		if (num1 = (num*2)) then
			writeln('El numero leido es el doble que 60')
		else	
			writeln('No se ha ingresado el doble de X');	
	readln();
end.
