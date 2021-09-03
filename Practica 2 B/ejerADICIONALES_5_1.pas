program ejer;

procedure monto_promedio(monto_total:real; cantidad_inversiones, codigo:integer);
	var
		promedio:real;
	begin
		promedio:=monto_total/cantidad_inversiones;
		writeln('La empresa ',codigo,' tiene un monto promedio de ', promedio:4:4);
	end;

procedure maximo(codigo:integer; monto_total:real; var codigo_max:integer; var monto_max:real);
	begin
		if (monto_total > monto_max) then begin
			monto_max:=monto_total;
			codigo_max:=codigo;
		end;	
	end;	

procedure cargar();
	var
		codigo, i, cantidad_inversiones, codigo_max, cant, cant_max:integer;
		monto_total, monto_max, monto:real;
	begin
		cant_max:=0;
		i:=0;
		codigo_max:=0;
		monto_max:=0;
		repeat
			write('Ingrese el codigo, la cantidad de inversiones y el monto');
			writeln(' dedicado a cada una de las inversiones');
			readln(codigo);
			readln(cantidad_inversiones);
				for i:=1 to cantidad_inversiones do begin
					readln(monto);
					monto_total:=monto_total+monto;
					if (monto > 50000) and (cant = 0) then
						cant:=cant+1;					
				end;
			if (cant <> 0) then	
				cant_max:=cant_max+1;
			monto_promedio(monto_total, cantidad_inversiones, codigo);
			maximo(codigo, monto_total, codigo_max, monto_max);
			monto_total:=0;
			cant:=0;
		until (codigo = 100);
		writeln('La empresa ',codigo_max,' es la que mayor dinero posee invertido (',monto_max:4:4,').');
		writeln('Hay ',cant_max,' empresas con inversiones por mas de 50000');
	end;

begin
	cargar();
	readln();
	end.