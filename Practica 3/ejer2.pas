program ejer;
type
	subclasedias=1..31;
	subclasemes=1..12;
	subclasanios=2019..2020;

 fecha=record {a- registro}
 	dia:subclasedias;
 	mes:subclasemes;
 	anio:subclasanios;
 end;

procedure carga(var c:fecha);{b}
	begin
		writeln('Ingrese el anio, mes y dia del casorio');
		readln(c.anio);
		if (c.anio <> 2020) then begin
			readln(c.mes);
			readln(c.dia);
		end;
	end;

 var
 	casamiento:fecha;
 	cant_verano, cant_primeros_dias:integer;

 begin
 	cant_verano:=0;
 	cant_primeros_dias:=0;
 	carga(casamiento);
 	while (casamiento.anio <> 2020) do begin
 		if (casamiento.mes >= 1) and (casamiento.mes <= 3) then {c}
			cant_verano:=cant_verano+1;
		if	(casamiento.dia <= 10) then {c}
			cant_primeros_dias:=cant_primeros_dias+1;
 		carga(casamiento);
 	end;
 	writeln('La cantidad de casamientos realizados durante los meses de verano ', cant_verano);
 	writeln('La cantidad de casamientos realizados en los primeros 10 dias de cada mes ', cant_primeros_dias);
 	readln();
 end.
