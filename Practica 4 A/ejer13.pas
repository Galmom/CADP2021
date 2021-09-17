{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ejer;
const
	max_100=4;//va 100
	max_50=2;//va 50
type
	rango1=1..max_100;
	rango2=1..max_50;
	string20=string[20];

	vec_100=array[rango1] of integer;

	dato=record
		temp:vec_100;
	end;

	vec_50=array[rango2] of dato;
	

	procedure leer(var v_50:vec_50; i:integer);
		var
			j:integer;
		begin
			writeln('entro ', i);
			for j:=1 to max_100 do begin
				readln(v_50[i].temp[j]);
			end;
		end;

	procedure carga(var a50:vec_50);
		var
			i:integer;
		begin
			for i:=1 to max_50 do begin
				leer(a50, i);
			end;
		end;

	procedure promedio_temp(anio_50:vec_50);{PODRIA OPTIMIZAR LLAMANDO DESDE EL PP LOS MODULOS, PERO NO ESTARIAN BIEN DEFINIDOS CADA UNO,
SE HARIA UNA MEZCOLANZA DE CODIGO, DE ESTA MANERA CADA UNO HACE LO JUSTO Y LO INDICADO}
		var
			i, j, anio:integer;
			suma_total, suma, max1:real;
		begin
			max1:=-1;
			anio:=0;
			for i:=1 to max_50 do begin
				suma_total:=0;	
				suma:=0;
				for j:=1 to max_100 do begin
					suma:=suma+anio_50[i].temp[j];	
				end;
				suma_total:=suma/max_100;
				if (suma_total > max1) then begin
					max1:=suma_total;
					anio:=i;
				end;
			end;
			writeln('El anio con mayor temperatura promedio a nivel mundial es, ',anio);
		end;

	procedure anio_max_temp(anio_50:vec_50);{PODRIA OPTIMIZAR LLAMANDO DESDE EL PP LOS MODULOS, PERO NO ESTARIAN BIEN DEFINIDOS CADA UNO,
SE HARIA UNA MEZCOLANZA DE CODIGO, DE ESTA MANERA CADA UNO HACE LO JUSTO Y LO INDICADO}
		var 
			i, j, pos:integer;
			max1:real;
		begin
			max1:=-1;
			for i:=1 to max_50 do begin
				for j:=1 to max_100 do begin
					if (anio_50[i].temp[j] > max1) then begin
						max1:=anio_50[i].temp[j];
						pos:=i;
					end;
				end;
			end;
			writeln('El anio con la mayor temperatura detectada en algún punto del planeta en los ultimos 50 anios es ', pos);
		end;	

	procedure imprimir(anio_50:vec_50);
		var
			i,j:integer;
		begin
			j:=0;
			i:=0;
			for i:=1 to 2 do begin
				for j:=1 to max_100 do begin
					writeln(anio_50[i].temp[j]);
				end;
			end;
		end;

	var
		anio_50:vec_50;
		i:integer;
	begin
		carga(anio_50);
		promedio_temp(anio_50); 
		anio_max_temp(anio_50);
		//imprimir(anio_50);
		readln();	
	end.