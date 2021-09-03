program ejer;
function rendimineto(ha:integer; zona:integer):real;
	var
	precio:real;
	begin
		precio:=320;
		if (zona = 1) then
			rendimineto:=ha*6
		else if (zona = 2) then
			rendimineto:=ha*2.6
		else if ( zona = 3) then
			rendimineto:=ha*1.4;

		rendimineto:=rendimineto*precio;		
	end;

procedure datos(var localidad:string; var ha:integer; var zona:integer);
	begin
		writeln('Ingrese la localidad, la cantidad de HA sembradas, tipo de siembra y precio');
		readln(localidad);
		readln(ha);
		readln(zona);
	end;

procedure maximo(localidad:string; ha:integer; zona:integer; var max1:real; var localidad1:string);
	var
		rendi_max:real;
	begin
		rendi_max:=rendimineto(ha, zona); //lo hago para no entrar dos veces a la funcion
		if ( rendi_max > max1) then begin
			max1:=rendi_max;
			localidad1:=localidad;
		end;
	end;

procedure minimo(localidad:string; ha:integer; zona:integer; var min1:real; var localidad2:string);
	var
		rendi_min:real;
	begin
		rendi_min:=rendimineto(ha, zona); //lo hago para no entrar dos veces a la funcion
		if ( rendi_min < min1) then begin
			min1:=rendi_min;
			localidad2:=localidad;
		end;
	end;		

var
	ha, zona, local_3, cant_localidades:integer;
	localidad, localidad1, localidad2:string[20];
	max1, min1, promedio_rendimiento:real;
begin
	cant_localidades:=0;
	promedio_rendimiento:=0;
	min1:=999999;
	max1:=-1;
	local_3:=0;
	repeat
		datos(localidad, ha, zona);
		if (localidad = 'tres de febrero') and ( rendimineto(ha, zona) > 10000) then
			local_3:=local_3+1;
		maximo(localidad, ha, zona, max1, localidad1);
		minimo(localidad, ha, zona, min1, localidad2);
		promedio_rendimiento:=promedio_rendimiento+rendimineto(ha, zona);
		writeln(promedio_rendimiento:3:3);
		cant_localidades:=cant_localidades+1;
		writeln(cant_localidades);
	until ((localidad = 'saladillo') and (ha = 900));
	writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es ', local_3);
	writeln('La localidad del campo con mayor rendimiento economico es ', localidad1);
	writeln('La localidad del campo con menor rendimiento economico es ', localidad2);
	writeln('El rendimiento economico promedio es ', (promedio_rendimiento/cant_localidades):4:3);
	readln();
	end.