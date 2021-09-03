program ejer;
var
	caracter:char;
	cant, j:integer;
begin
	j:=0;
	cant:=0;
	for j:=1 to 3 do begin
		writeln('Ingrese 1 caracteres');
		readln(caracter);
		if (caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u') then begin
			cant:=cant+1;
		end;
	end;
	if (cant = 3) then 
		writeln('Los tres son vocales')
	else
		writeln('Al menos un caracter no es vocal');		
	readln();
end.