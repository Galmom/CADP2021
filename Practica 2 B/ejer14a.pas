program ejer;
procedure datos(var ha:integer; var zona:integer; var precio:real);
	begin
		write('Ingrese la cantidad de HA sembradas, el tipo de siembra');
		writeln(' y el precio de tonelada de SOJA');
		readln(ha);
		readln(zona);
		readln(precio);
	end;

procedure rendimiento(zona, ha:integer; var ren_economico:real);
	begin
		if (zona = 1) then
			ren_economico:=ha*6
		else if (zona = 2)	then
			ren_economico:=ha*2.6
		else if (zona = 3) then	
			ren_economico:=ha*1.4;
	end;

var
	ha, zona:integer;
	precio, ren_economico:real;
begin
	ren_economico:=0;
	datos(ha, zona, precio);
	rendimiento(zona, ha, ren_economico);
	writeln('El rendimiento economico esperado es ',ren_economico:4:3,' T/ha');
	readln();
	end.