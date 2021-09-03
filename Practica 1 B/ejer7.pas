program ejer;
var
	i:integer;
	piloto, nam_max1, nam_max2, nam_min1, nam_min2:string[20];
	tiempo, tiempo_max1, tiempo_max2, tiempo_min1, tiempo_min2:real;
begin
	tiempo_max2:=-1;
	tiempo_max1:=-1;
	tiempo_min2:=999;
	tiempo_min1:=999;
	i:=0;
	for i:=1 to 100 do begin
		write('Ingrese el nombre del piloto y el tiempo total ');
		writeln('que le tomo finalizar la carrera');
		readln(piloto);
		readln(tiempo);
		if (tiempo > tiempo_max1) then begin
			tiempo_max2:=tiempo_max1;
			nam_max2:=nam_max1;
			tiempo_max1:=tiempo;
			nam_max1:=piloto;
		end
		else if (tiempo > tiempo_max2) then begin
			tiempo_max2:=tiempo;
			nam_max2:=piloto;
		end;	
		if (tiempo < tiempo_min1) then begin
			tiempo_min2:=tiempo_min1;
			nam_min2:=nam_min1;
			tiempo_min1:=tiempo;
			nam_min1:=piloto;
		end
		else if (tiempo < tiempo_min2) then begin
			tiempo_min2:=tiempo;
			nam_min2:=piloto;
		end;		
	end;	
		write('Los nombres de los dos pilotos que finalizaron');
		writeln(' en los dos primeros puestos es ', nam_max1, ' y ', nam_max2);
		write('Los nombres de los dos pilotos que finalizaron');
		writeln(' en los dos ultimos puestos es ',nam_min1, ' y ', nam_min2);
	readln();
end.