program ejer;
var
	num, min1, min2:integer;
begin
	min1:=999;
	min2:=999;
	repeat
		writeln('Ingrese un numero');
		readln(num);
		if (num < min1) then begin
			min2:=min1;
			min1:=num;	
		end
		else if (num < min2) then begin
			min2:=num;
		end;
	until(num = 0);
	writeln('Los dos numeros minimos leidos son ',min1, ' y ', min2);
readln();
end.