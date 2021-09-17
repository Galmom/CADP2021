{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. 
De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. 

La información se ingresa ordenada por código de avión y, para cada avión, por país de salida. 

La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}
program ejer;
type
	string20=string[20];

	viaje=record
		codigo_avion:integer;
		pais_salida:string20;
		pais_llegada:string20;
		cant_km_recorrido:integer;
		porcen_ocupacion:real;
	end;

	procedure carga(v:viaje);
		begin
			write('Ingrese el codigo de avion, pais de salida, pais de llegada,');
			writeln(' cantidad de kilometros recorridos y porcentaje de ocupacion del avion.');
			readln(v.codigo_avion);
			if (v.codigo_avion <> 44) then begin
				readln(v.pais_salida);
				readln(v.pais_llegada);
				readln(v.cant_km_recorrido);
				readln(v.porcen_ocupacion);
			end;
		end;
	procedure maximo_km(cant_km_recorrido, codigo_avion:integer;var max1, max2, cod1, cod2:integer);
		begin
			if (cant_km_recorrido > max1) then begin
				max2:=max1;
				cod2:=cod1;
				max1:=cant_km_recorrido;
				cod1:=codigo_avion;
			end
			else
				if (cant_km_recorrido > max2) then begin
					max2:=cant_km_recorrido;
					cod2:=codigo_avion;
				end;
		end;

	procedure minimo_km(cant_km_recorrido, codigo_avion:integer;var min1, min2, cod_min1, cod_min2:integer);
		begin
			if (cant_km_recorrido > min1) then begin
				min2:=min1;
				cod_min2:=cod_min1;
				min1:=cant_km_recorrido;
				cod_min1:=codigo_avion;
			end
			else
				if (cant_km_recorrido > min2) then begin
					min2:=cant_km_recorrido;
					cod_min2:=codigo_avion;
				end;
		end;
	procedure maximo_avion_paises(cuenta_pais_diferente:integer; var max_avion, codigo_avion, max_codigo_vuelo:integer);
		begin
			if (cuenta_pais_diferente > max_avion) then
				max_codigo_vuelo:=codigo_avion;
		end;			

	var
		vuelo:viaje;
		pais_actual:string20;
		actual, max1, max2, cod_max1, cod_max2, min1, min2, cod_min1, cod_min2, cant_km:integer;
		cuenta_pais_diferente, max_codigo_vuelo, max_avion, cant_60, cant_llegada:integer;
	begin
		cant_km:=0;
		cuenta_pais_diferente:=0
		max_codigo_vuelo:=0;
		max_avion:=0;
		max1:=-1;
		max2:=-1;
		cod_max1:=0;
		cod_max2:=0;
		min1:=0;
		min2:=0;
		cod_min1:=0; 
		cod_min2:=0;
		cant_60:=0;
		cant_llegada:=0;
		carga(vuelo);
		while (vuelo.codigo_avion <> 44) do begin{inicio corte de codigo}
			actual:=vuelo.codigo_avion;
			while (vuelo.codigo_avion <> 44) and (vuelo.codigo_avion = actual) do begin {mismo codigo avion}
				pais_actual:=vuelo.pais_salida;
				
					cuenta_pais_diferente:=cuenta_pais_diferente+1; 
				while (vuelo.codigo_avion <> 44) and (vuelo.pais_salida = pais_actual) do begin {mismo pais}
					carga(vuelo);
					cant_km:=cant_km+vuelo.cant_km_recorrido;
					if (vuelo.cant_km_recorrido > 5000) and (vuelo.porcen_ocupacion >60) then
						cant_60:=cant_60+1;	
					if (vuelo.cant_km_recorrido < 1000) and (vuelo.pais_llegada = 'australia') or (vuelo.pais_llegada = 'zelanda')  then
						cant_llegada:=cant_llegada+1;
				end; {cambia de pais}
			end; {cambia codigo avion }
			maximo_km(cant_km, vuelo.codigo_avion, max1, max2, cod_max1, cod_max2);
			minimo_km(cant_km, vuelo.codigo_avion, min1, min2, cod_min1, cod_min2);
			writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda ', cant_llegada);
			writeln('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion. ', cant_60);
			maximo_avion_paises(cuenta_pais_diferente, max_avion, vuelo.codigo_avion, max_codigo_vuelo);
			cuenta_pais_diferente:=0;
			cant_llegada:=0;
			cant_60:=0;
			cant_km:=0;
		end; {fin codigo avion}
		writeln('Los dos aviones que mas km recorrieron ',cod_max1,' y ',cod_max2);
		writeln('Los dos aviones que mas km recorrieron ',cod_min1,' y ',cod_min2);
		writeln('El avion que salio desde mas paises diferentes ',max_codigo_vuelo);
		readln();
	end.