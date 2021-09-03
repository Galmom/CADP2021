program ejer;
procedure cantidad_digitos(num:QWord; var cant_digi, sum_digi:QWord);
	var
		dig:QWord;{lee 20 digitos}
	begin
		cant_digi:=0;
		sum_digi:=0;
		while (num <> 0) do begin
			dig:=num mod 10;
			cant_digi:=cant_digi+1;
			sum_digi:=sum_digi+dig;
			num:=num div 10;			
		end;
	end;
var
	num, cant_digi, sum_digi:QWord;
begin
	writeln('Ingrese un numero');
	readln(num);
	cantidad_digitos(num, cant_digi, sum_digi);
	while (sum_digi <> 10) do begin
		writeln('La cantidad de numeros es ', cant_digi);
		writeln('Ingrese un numero');
		readln(num);
		cantidad_digitos(num, cant_digi, sum_digi);
	end;
	readln();
end.