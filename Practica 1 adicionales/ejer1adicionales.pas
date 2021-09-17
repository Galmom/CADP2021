program ejer;
var
	codigo, cant_inversion, i, cant, cant_max, codigo_max:integer;
	monto, monto_total, monto_promedio, monto_max:real;
begin
	cant:=0;
	cant_max:=0;
	monto_max:=0;
	monto_promedio:=0;
	monto_total:=0;
	i:=0;
	repeat
		writeln('Ingrese el codigo de la empresa');
		readln(codigo);
		writeln('Ingrese la cant. de inversiones');
		readln(cant_inversion);
		for i:=1 to cant_inversion do begin
			writeln('Ingrese el monto de cada inversion ', i);
			readln(monto);
			if (monto > 50000) and (cant = 0) then begin
				cant:=cant+1;
			end;
			monto_total:=monto_total+monto;
		end;
		monto_promedio:=monto_total/cant_inversion;
		writeln('La empresa ',codigo,' tiene un monto promedio de ', monto_promedio:4:4);
		if (monto_total > monto_max) then begin
			monto_max:=monto_total;
			codigo_max:=codigo;
		end;
		if (cant <> 0) then begin
			cant_max:=cant_max+1;
		end;
		monto_total:=0;
		cant:=0;
	until (codigo = 100);
	writeln('La empresa ',codigo_max,' es la que mayor dinero posee invertido (',monto_max:4:4,').');
	writeln('Hay ',cant_max,' empresas con inversiones por mas de 50000');
	readln();
end.
