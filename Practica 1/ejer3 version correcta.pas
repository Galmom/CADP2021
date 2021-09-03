program ejer;
var
	num1, num2, num3:integer;
begin
	writeln('Escriba 3 numeros');
	readln(num1);
	readln(num2);
	readln(num3);
	
	if (num1 > num2) and (num1 > num3) then begin
		if  (num2 > num3) then begin
			writeln('El orden es ', num1, ' ', num2, ' ', num3);
		end
		else
			writeln('El orden es ', num1, ' ', num3, ' ', num2);
	end
	else
	begin
		if (num2 > num1) and (num2 > num3) then begin
			if  (num1 > num3) then begin
				writeln('El orden es ', num2, ' ', num1, ' ', num3);
			end
			else
				writeln('El orden es ', num2, ' ', num3, ' ', num1);
		end
		else
		begin
			if  (num1 > num2) then begin
				writeln('El orden es ', num3, ' ', num1, ' ', num2);
			end
			else
				writeln('El orden es ', num3, ' ', num2, ' ', num1);
		end;
	end;
	
	readln();
end.
