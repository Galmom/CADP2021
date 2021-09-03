program ejer;
procedure minimos(codigo:integer; precio:real; var precio_min1, precio_min2:real; var codigo_1, codigo_2:integer);
	begin
		if (precio < precio_min1) then begin
			precio_min2:=precio_min1;
			codigo_2:=codigo_1;
			precio_min1:=precio;
			codigo_1:=codigo;
		end
		else if (precio < precio_min2) then	begin
			precio_min2:=precio;	
			codigo_2:=codigo;
		end;	
	end;

procedure codigo_par(codigo:integer; precio:real; var cantidad:integer);

	begin
		if (precio > 16) and (codigo mod 2 = 0) then
			cantidad:=cantidad+1;
	end;

var
	precio_min1, precio_min2, precio:real;
	i:integer;
	codigo, codigo_1, codigo_2, cantidad:integer;
begin
	cantidad:=0;
	i:=0;
	precio_min1:=9999;
	precio_min2:=9999;
	codigo_1:=0;
	codigo_2:=0;
	for i:=1 to 4 do begin
		writeln('Ingrese un codigo (entre 1 a 200) y precio');
		readln(codigo);
		if (codigo >=1) and (codigo <=200) then
			readln(precio)
		else begin
			writeln('No ingreso un codigo entre 1 a 200, ingreselo de nuevo');
			readln(codigo);
			readln(precio);
		end;
	minimos(codigo, precio, precio_min1, precio_min2, codigo_1, codigo_2);
	codigo_par(codigo, precio, cantidad);
	end;
	writeln('Los codigos de los dos productos mas baratos es ', codigo_1,' y ', codigo_2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es ',cantidad);
	readln();
end.