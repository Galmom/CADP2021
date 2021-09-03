program ejer;
procedure minimos(precio:real; codigo:integer; var min1, min2:real; var cod1, cod2:integer);
	begin
		if (precio < min1) then begin
			min2:=min1;
			cod2:=cod1;
			min1:=precio;
			cod1:=codigo
		end
		else if (precio < min2) then begin
			min2:=precio;
			cod2:=codigo;
		end;
	end;
procedure maximos(precio:real; codigo:integer; var max1:real; var codmax:integer);
	begin
		if (precio > max1) then begin
			max1:=precio;
			codmax:=codigo;
		end;
	end;
var
		precio, suma_precios, min2, min1, precio_promedio, max1:real;
		codigo, i, cod1, cod2, codmax:integer;
		tipo:string[20];		
			
begin
	min1:=9999;
	min2:=9999;
	max1:=-1;
	codmax:=0;
	precio_promedio:=0;
	suma_precios:=0;
	i:=0;
	for i:=1 to 100 do begin
		writeln('Ingrese el precio, codigo y tipo de prenda');
		readln(precio);
		readln(codigo);
		readln(tipo);
		minimos(precio, codigo, min1, min2, cod1, cod2);
			if (tipo = 'pantalon') then
				maximos(precio, codigo, max1, codmax);//me lo guarda siempre en los var que mando, pero aca abajo
			{if (i = 4) then 
				writeln('El codigo del pantalon es ', codmax);}// otra solucion para que muestre	
		suma_precios:=suma_precios+precio;
	end;
	precio_promedio:=suma_precios/100;
	writeln('El codigo de los dos productos mas baratos es ',cod1, ' y ', cod2);
	writeln('El Precio promedio es ', precio_promedio:2:2);
	writeln('El codigo del pantalon es ', codmax);
	readln();
end.