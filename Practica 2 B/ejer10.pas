program ejer;
procedure secuencia(numero:longint; var suma, cant_impar:longint);
	var
		digito:longint;
		cant:integer;
	begin
		cant:=0;
		digito:=0;
		while (numero <> 0) do begin
			digito:= numero mod 10;
				cant:=cant+1;
				if (digito mod 2 = 0) then
					suma:=suma+digito
				else
					cant_impar:=cant_impar+1;
			numero:=numero div 10;		
		end;
		writeln(cant);	
	end;
var
	numero, suma, cant_impar:longint;
begin
	writeln('Ingrese un numero');
	readln(numero);
	while (numero <> 123456) do begin
		secuencia(numero, suma,cant_impar);
		writeln('La suma de sus digitos pares es ', suma,' y la cantidad de digitos impares que posee ', cant_impar);
		suma:=0;
		cant_impar:=0;
		writeln('Ingrese un numero');
		readln(numero);
	end;
	readln();
end.