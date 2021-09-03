program ejer;
var
	i, suma, num, cant:integer;
begin
	cant:=0;
	i:=0;
	suma:=0;
	for i:=1 to 10 do begin
		writeln(i,' ingrese un numero');
		readln(num);
		suma:=suma+num;
		if (num > 5) then
			cant:=cant+1;
	end;
	writeln('La suma total es ', suma, ' y la cantidad mayores a 5 es ', cant);
readln();
end.
