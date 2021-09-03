program ejer;
var
	precio, min1, min2, codigo, cod1, cod2, cant, i:integer;

begin
	i:=0;
	cod2:=0;
	cod1:=0;
	cant:=0;
	min1:=999;
	min2:=999;
	for i:=1 to 3 do begin
		writeln('Ingrese el codigo y el precio');
		readln(codigo);
		if (codigo >= 1) and (codigo <= 200) then begin
			readln(precio);
			if (precio < min1) then begin
				min2:=min1;
				cod2:=cod1;
				min1:=precio;	
				cod1:=codigo;
			end
			else if (precio < min2) then begin
				cod2:=codigo;
				min2:=precio;
			end;
		end;
		if (precio > 16) and (codigo mod 2 = 0) then begin
		cant:=cant+1;
		end;
	end;
	writeln('Los productos mas baratos son ', cod1, ' y ', cod2);	
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es ',cant);
readln();
end.