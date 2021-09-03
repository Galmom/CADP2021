program ejer; {SER SUPONE QUE HAY RECURSANTES E INGRESANTES... SI NO DA ERROR, YA QUE UNO O EL OTRO ESTA TRABAJANDO CON 0 ERROR EN DIVICIONES}
var
	legajo, condi_i, condi_r, i, condicion_rendir_ingre,condicion_rendir_recur, nota_aprobado_ingre, nota_aprobado_recur:integer;
	nota_todas_aprobadas_final, nota_todas_aprobadas, cant_alumnos, promedio_6, nota_0, nota_0_final:integer;
	cant_10, cant_10_max1, cant_10_max2, cod_10_1, cod_10_2, cod_0_1, cod_0_2, cant_0, cant_0_max1, cant_0_max2:integer;
	condicion:char;
	nota, porcentaje_ingre, porcentaje_recur, suma_nota, promedio:real;
begin
	cant_0_max1:=0;
	cant_0_max2:=0;
	cant_0:=0;
	cod_0_1:=999;
	cod_0_2:=999;
	cant_10:=0;
	cant_10_max1:=-1;
	cant_10_max2:=-1;
	cod_10_1:=0;
	cod_10_2:=0;
	nota_0:=0;
	nota_0_final:=0;
	cant_alumnos:=0;
	suma_nota:=0;
	promedio_6:=0;
	promedio:=0;
	nota_todas_aprobadas:=0;
	nota_todas_aprobadas_final:=0;
	porcentaje_recur:=0;
	porcentaje_ingre:=0;
	nota_aprobado_ingre:=0;
	nota_aprobado_recur:=0;
	condicion_rendir_ingre:=0;
	condicion_rendir_recur:=0;
	i:=0;
	condi_r:=0;
	condi_i:=0;
	writeln('Ingrese el legajo del alumno');
	readln(legajo);
	while (legajo <> -1) do begin
		writeln('Ingrese su condicion I o R');
		readln(condicion);
		cant_alumnos:=cant_alumnos+1;
			if (condicion = 'i') then begin
				condi_i:=condi_i+1;
				for i:=1 to 5 do begin		
					write('Ingrese la nota de la ',i, ' autoevaluacion, si no la realizo ');
					writeln('en tiempo y forma ingrese -1');		
					readln(nota);
						if (nota >= 4) and (nota_aprobado_ingre <=4) then {parte del ingresante}
							nota_aprobado_ingre:=nota_aprobado_ingre+1;	{veo si llega los 4 aprobados con nota mayor a 4}		
						if (nota_aprobado_ingre = 4) then
							condicion_rendir_ingre:=condicion_rendir_ingre+1;
						if (nota >=4) then
							nota_todas_aprobadas:=nota_todas_aprobadas+1;
						if (nota = 0) and (nota_0 < 1 ) then
							nota_0:=nota_0+1;
						if (nota = 10) then
							cant_10:=cant_10+1;
						if (nota = 0) then	
							cant_0:=cant_0+1;
						if (cant_10 <> 0) then begin
							if (cant_10 > cant_10_max1) then begin
								cant_10_max2:=cant_10_max1;
								cod_10_2:=cod_10_1;
								cant_10_max1:=cant_10;
								cod_10_1:=legajo;
							end
							else
								if (cant_10 > cant_10_max2) then begin
									cant_10_max2:=cant_10;
									cod_10_2:=legajo;
							end;
						end;
						if (cant_0 <> 0) then begin
							if (cant_0 > cant_0_max1) then begin
								cant_0_max2:=cant_0_max1;
								cod_0_2:=cod_0_1;
								cant_0_max1:=cant_0;
								cod_0_1:=legajo;
							end
							else
								if (cant_0 > cant_0_max2) then begin
									cant_0_max2:=cant_0;
									cod_0_2:=legajo;
							end;
						end;		
					suma_nota:=suma_nota+nota;	
				end;
			end
			else begin {parte del recursante}
			 	condi_r:=condi_r+1;
			 	for i:=1 to 5 do begin		
					write('Ingrese la nota de la ',i,' autoevaluacion, si no la realizo ');
					writeln('en tiempo y forma ingrese -1');		
					readln(nota);
						if (nota > 4) and (nota_aprobado_recur <=4) then
							nota_aprobado_recur:=nota_aprobado_recur+1;
						if (nota_aprobado_recur = 4) then
							condicion_rendir_recur:=condicion_rendir_recur+1;
						if (nota >=4) then
							nota_todas_aprobadas:=nota_todas_aprobadas+1;
						if (nota = 0) and (nota_0 < 1 ) then
							nota_0:=nota_0+1;
						if (nota = 0) then	
							cant_0:=cant_0+1;
						if (cant_10 <> 0) then begin
							if (cant_10 > cant_10_max1) then begin
								cant_10_max2:=cant_10_max1;
								cod_10_2:=cod_10_1;
								cant_10_max1:=cant_10;
								cod_10_1:=legajo;
							end
							else
								if (cant_10 > cant_10_max2) then begin
									cant_10_max2:=cant_10;
									cod_10_2:=legajo;
							end;
						end;
						if (cant_0 <> 0) then begin
							if (cant_0 > cant_0_max1) then begin
								cant_0_max2:=cant_0_max1;
								cod_0_2:=cod_0_1;
								cant_0_max1:=cant_0;
								cod_0_1:=legajo;
							end
							else
								if (cant_0 > cant_0_max2) then begin
									cant_0_max2:=cant_0;
									cod_0_2:=legajo;
							end;
						end;
					suma_nota:=suma_nota+nota;		
				end;
			end;
			promedio:=suma_nota/5;
			if (nota_0 = 1) then
				nota_0_final:=nota_0_final+1;
			if (promedio > 6.5) then
				promedio_6:=promedio_6+1;
			if (nota_todas_aprobadas = 5) then
				nota_todas_aprobadas_final:=nota_todas_aprobadas_final+1;	
			nota_aprobado_recur:=0;
			nota_aprobado_ingre:=0;
			nota_todas_aprobadas:=0;
			suma_nota:=0;
			cant_10:=0;
			cant_0:=0;
			nota_0:=0;
			writeln('Ingrese el legajo del alumno');
			readln(legajo);
	end;
	porcentaje_ingre:=condicion_rendir_ingre*100/condi_i;
	porcentaje_recur:=condicion_rendir_recur*100/condi_r;
	writeln('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial ',condicion_rendir_ingre);
	writeln('El porcentaje sobre el total de alumnos INGRESANTES ', porcentaje_ingre:2:2);
	writeln('La cantidad de alumnos RECURSANTE en condiciones de rendir el parcial ', condicion_rendir_recur);
	writeln('El porcentaje sobre el total de alumnos RECURSANTE ', porcentaje_recur:2:2);
	writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones ', nota_todas_aprobadas_final);
	writeln('La Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos ',promedio_6);
	writeln('La Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion ', nota_0_final);
	writeln('El Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) ',cod_10_1,' y ', cod_10_2);
	writeln('El Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) ',cod_0_1,' y ', cod_0_2);
	readln();
end.