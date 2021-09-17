{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de 
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android 
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). 
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la 
información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program ejer;
type
	
	movil=record
		ver_android:real;
		tamanio_panta:real;
		cant_ram:integer;
		end;

	lista=^nodo;

	nodo=record
		dato:movil;
		sig:lista;
		end;

	procedure leer_movil(var m:movil);
		begin
			writeln('Ingrese la cantidad de RAM');
			readln(m.cant_ram);
				if (m.cant_ram <> 0) then begin //LE AGREGUE UN CORTE
					writeln('Ingrese la version de Android');
					readln(m.ver_android);
					writeln('Ingrese el tamanio de pantalla');
					readln(m.tamanio_panta);
				end;
		end;

	procedure agregarordenado(var l:lista; m:movil);
		var
			ant, act, nue:lista;
		begin
			new(nue);
			nue^.dato:=m;
			ant:=l;
			act:=l;
			while (act <> nil) and (act^.dato.ver_android < m.ver_android) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (ant = act) then
				l:=nue
			else
				ant^.sig:=nue;
			nue^.sig:=act;		
		end;

	procedure cargar(var l:lista);
		var
			m:movil;
		begin
			leer_movil(m);
			while (m.cant_ram <> 0) do begin
				agregarordenado(l, m);
				leer_movil(m);
			end;
		end;
	
	procedure recorrerlista(l:lista);
		var
			actual, promedio, suma_total:real;
			cant_version, cant_ramypantalla, cant_dispositivos:integer;
		begin
			suma_total:=0;
			promedio:=0;
			cant_dispositivos:=0;
			cant_ramypantalla:=0;
			while (l <> nil) do begin
			actual:=l^.dato.ver_android;
			cant_version:=0;
				while (l <> nil) and (l^.dato.ver_android = actual) do begin
					if (l^.dato.cant_ram > 3) and (l^.dato.tamanio_panta <= 5) then
						cant_ramypantalla:=cant_ramypantalla+1;
					cant_version:=cant_version+1;
					cant_dispositivos:=cant_dispositivos+1;
					suma_total:=suma_total+l^.dato.tamanio_panta;
					l:=l^.sig;
				end;
				writeln('La cantidad de dispositivos para la version ',actual:3:2,' de Android es ', cant_version);
			end;
			promedio:=suma_total/cant_dispositivos;
			writeln('La cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es ', cant_ramypantalla);
			writeln('El tamanio promedio de las pantallas de todos los dispositivos es ', promedio:4:2);
		end;

	var
		l:lista;
	begin
		l:=nil;
	cargar(l);
	recorrerlista(l);
	readln;
	end.