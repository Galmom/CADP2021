
program ejer;
type
	lineas=record
		cantidad:integer;
		numero:integer;
		cant_consumido:real;
		cant_MB_consumido:real;
	end;

	persona=record
		codigo:integer;
		cant_lineas:lineas;
	end;

	procedure monto(cc, mbc:real; var cons1_pagar, mb_consu_pagar:real);
		var
			carga1, carga2:real;
		begin
			carga1:=cc*3.4;{consumo tel mint}
			carga2:=mbc*1.35;{consumo mb mint}
			cons1_pagar:=cons1_pagar+carga1;
			mb_consu_pagar:=mb_consu_pagar+carga2;	
			carga1:=0;
			carga2:=0;
		end;


	procedure leer_lineas(var l:lineas);
		var
			i:integer;
			cons1_pagar, mb_consu_pagar:real;
		begin
			i:=0;
			readln(l.cantidad);
			for i:=1 to l.cantidad do begin
				write('Ingrese el numero de telefono, la cantidad de minutos consumidos');
				writeln(' y la cantidad de MB consumidos en el mes de la linea ',i);
				readln(l.numero);
				readln(l.cant_consumido);
				readln(l.cant_MB_consumido);
				monto(l.cant_consumido, l.cant_MB_consumido, cons1_pagar, mb_consu_pagar);
			end;
			writeln('La cantidad total de minutos es ',cons1_pagar:4:4,' y la cantidad total de MB a facturar del cliente es ', mb_consu_pagar:4:4);
			
		end;

	procedure cargar(var c:persona);
		begin
			writeln('Ingrese el codigo de cliente y la cantidad de lineas a su nombre');
			readln(c.codigo);
			leer_lineas(c.cant_lineas);
		end;
	// procedure facturar(cc, mbc: real; var minutos, mb:real);
	// 	begin
	// 		minutos:=3.4*cc;
	// 		mb:=1.35*mbc;
	// 	end;

var
	cliente:persona;
	i:integer;
	minutos, mb:real;
begin
	i:=0;
	for i:=i to 2 do begin{9300 en 2}
		cargar(cliente);
		// facturar(cliente.cant_lineas.cant_consumido,cliente.cant_lineas.cant_MB_consumido, minutos, mb);
		// writeln('La cantidad total de minutos es ',minutos:4:4,' y la cantidad total de MB a facturar del cliente es ', mb:4:4);
	end;
	readln();
	end.