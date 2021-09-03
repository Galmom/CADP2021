program ejer;
var
	i, dia:integer;
	venta_dia, monto_dia, monto_acumulado,max:real;
begin
	venta_dia:=0;
	monto_acumulado:=0;
	monto_dia:=0;
	i:=0;
	max:=0;
	dia:=0;
	for i:=1 to 4 do begin
		writeln('Ingrese el monto de la venta realizada');
		readln(venta_dia);
		while (venta_dia <> 0) do begin
			monto_dia:=monto_dia+venta_dia;
			writeln('Ingrese el monto de la venta realizada');
			readln(venta_dia)
		end;
		if (monto_dia > max) then begin 
			dia:=i;
			max:=monto_dia;
		end;	
		monto_acumulado:=monto_acumulado+monto_dia;
		writeln('La venta total del dia es ', monto_dia:4:2);
		monto_dia:=0;		
	end;	
		writeln('La venta total del mes es ', monto_acumulado:4:2);
		writeln('El dia en el que se realizo la mayor cantidad de ventas es ',dia);
	readln();
end.