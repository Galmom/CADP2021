program ejer;
var
	i, num, min1, min2:integer;
begin
	i:=0;
	min1:=999;
	min2:=999;
	for i:=1 to 1000 do begin
		writeln(i,' Ingrese un numero');
		readln(num);
		if (num < min1) then begin
			min2:=min1;
			min1:=num;	
		end
		else if (num < min2) then begin
			min2:=num;
		end;
	end;
	writeln('Los dos numeros minimos leidos son ',min1, ' y ', min2);
readln();
end.