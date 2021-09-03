program ejer;
procedure negativo();
	var
		numero, numero_max:integer;
	begin
	numero_max:=-1;
	 writeln('Ingrese un numero entero');
	 readln(numero);
	 while (numero > 0) do begin
	 if (numero mod 2 = 0) then begin
	 	if (numero > numero_max) then
	 		numero_max:=numero;
	 end;
	 writeln('Ingrese un numero entero');
	 readln(numero);
	 end;
	 writeln('El numero par mas alto es ', numero_max);
	end;

begin
	negativo;
	readln();
end.