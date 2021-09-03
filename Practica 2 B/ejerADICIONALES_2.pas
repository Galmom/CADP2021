program ejer;
procedure suma(num1, num2:integer; var suma_resul:integer);
	var
		i:integer;
	begin
		i:=0;
		suma_resul:=0;
		if (num1 > num2) then begin
			for i:=num1 downto num2 do begin
				suma_resul:=suma_resul+i;
			end;
		end		
		else
			if (num1 < num2) then begin	
				for i:=num1 to num2 do begin
					suma_resul:=suma_resul+i;
				end;				
		end;
	end;
procedure multiplicacion(num1, num2:integer; var multi_resul:integer);
	var
		i:integer;
	begin
		i:=num1+1;
		multi_resul:=1;
		if (num1 > num2) then begin
			for i:=num1 downto num2 do begin
				multi_resul:=multi_resul*i;
			end;
		end
		else
			if (num1 < num2) then begin
				for i:=num1 to num2 do begin
				multi_resul:=multi_resul*i;
			end;
		end;
	end;
var
	num1, num2, suma_resul, multi_resul, i:integer;
begin
	i:=0;
	suma_resul:=0;
	multi_resul:=0;
	for i:=1 to 10 do begin
		writeln('Ingrese 2 numeros');
		readln(num1);
		readln(num2);
		suma(num1, num2, suma_resul);
		multiplicacion(num1, num2, multi_resul);
		writeln(i,' resultados');
		writeln('La suma es ' ,suma_resul);
		writeln('El producto es ', multi_resul);	
	end;			
	readln();
end.