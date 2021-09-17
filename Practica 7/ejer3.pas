{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.
}


program ejer;
type
	viaje=record
		num_viaje:integer;
		cod_auto:integer;
		dire_origen:real;
		dire_destino:real;
		km_recorridos:real;
		end;

	lista=^nodo;
	
	nodo=record
		nodo:viaje;
		sig:lista;
		end;
	procedure maximo(actual:integer; km_cant:real; var max1, max2:real; var cod1, cod2:integer);
		var
		begin
			if (km_cant > max1) then begin
				max2:=max1;
				cod2:=cod1;
				max1:=km_recorridos;
				cod1:=actual;
			end
			else
				if (km_cant > max2) then begin
					max2:=km_recorridos;
					cod2:=actual;
				end;
		end;
	procedure cargarordenado(var l2:lista; v:viaje);
		var
			act, ant, nue;
		begin
			new(nue);
			nue^.dato:=v;
			ant:=l2;
			act:=l2;
			while (act = nil) and (act^.dato.num_viaje < l2^.dato.num_viaje) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act = ant) then
				l:=nue
			else
				ant^.sig:=nue;
			nue^.sig:=act;
		end;

	var
		l, l2:lista;
		v:viaje;
	begin
		l:=nil;
		l2:=nil;
		//cargarlista(l); se dispone
		while (l <> nil) do begin
			actual:=l^.dato.cod_auto;
			while (l <> nil) and (l^.dato.cod_auto <> actual) do begin
				km_cant:=km_cant+l^.dato.km_recorridos;
				if (l^.dato.km_recorridos > 5) then begin
					cargarordenado(l2, v);
				l:=l^.sig;
			end;
			maximo(actual, km_cant, max1, max2, cod1, cod2);
		end;
		writeln('los dos códigos de auto que más kilómetros recorrieron ',cod1,' y ',cod2);
	end.