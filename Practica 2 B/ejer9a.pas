program ejer;
procedure cantidad_digitos(num:integer; var cant_digi, sum_digi:integer);
	var
		dig:integer;
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
	num, cant_digi, sum_digi:integer;
begin
	writeln('Ingrese un numero');
	readln(num);
	cantidad_digitos(num, cant_digi, sum_digi);
	writeln('La cantidad de numeros es ', cant_digi,' y la suma de digitos es ', sum_digi);
	readln();
end.