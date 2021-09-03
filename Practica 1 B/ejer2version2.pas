program ejer;
var
	i,num, max, orden:integer;
begin
	i:=0;
	orden:=0;
	max:=-1;
	for i:=1 to 10 do begin
		writeln(i, ' Ingrese un numero');
		readln(num);
		if (num > max) then begin
			max:=num;
			orden:=i;
		end;
	end;
	writeln('El mayor numero es ', max, ' en el puesto ', orden);
readln();
end.