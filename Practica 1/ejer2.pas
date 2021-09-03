program ejer;
var
	num1:integer;
begin
	writeln('Escriba un numero');
	readln(num1);
	if (num1 < 0) then begin
	num1:=num1*-1;
	end;
	writeln('el valor absoluto del numero es ', num1);
	readln();
end.