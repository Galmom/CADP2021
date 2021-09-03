program ejer;
var
	num1, num2:integer;
begin
	writeln('Ingrese 2 numeros enteros');
	readln(num1);
	readln(num2);
	if (num1 > num2) then begin
		writeln(num1, ' es mayor que ', num2);	
	end
	else	
		if (num2 > num1) then begin
			writeln(num2, ' es mayor que ', num1);
		end	
		else if (num1=num2) then begin
			writeln('Los numero son iguales');
		end;
	readln();
end.
