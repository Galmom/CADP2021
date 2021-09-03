program ejer;
var
	caracter:char;
	num, resta, suma:integer;
begin
	resta:=0;
	suma:=0;
	writeln('Ingrece el caracter + o -');
	readln(caracter);
	if (caracter = '+') or (caracter = '-')then begin
		if (caracter = '+') then begin
			writeln('Ingreceun numero');
			readln(num);
	 		while (num <> 0) do begin
	 			suma:=suma+num;
	 			writeln('Ingreceun numero');
	 			readln(num);
	 		end;
	 		writeln('El valor es ', suma);	
	 	end;	
		if (caracter = '-') then begin
			writeln('Ingreceun numero');
			readln(num);
	 		while (num <> 0) do begin
	 			resta:=resta-num;
	 			writeln('Ingreceun numero');
	 			readln(num);
	 		end;
		 writeln('El valor es ', resta);	
		 end;
	 end
	 else begin
	 		writeln('mal caracter');
	 	end;	
	readln();
end.