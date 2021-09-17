{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada 
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa 
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program ejer;
type
	string20=string[20];

	producto=record
		codigo:integer;
		descripcion:string20;
		stock_actual:integer;
		stock_minimo:integer;
		precio:real;
	end;

	lista=^nodo;

	nodo=record
		dato:producto;
		sig:lista;
	end;

procedure leer_producto(var p:producto);
	begin
		writeln('Ingrese el codigo del producto');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			writeln('Ingrese la descripcion del producto');
			readln(p.descripcion);
			writeln('Ingrese el stock actual');
			readln(p.stock_actual);
			writeln('ingrese el stock minimo y el precio');
			readln(p.stock_minimo);
			readln(p.precio);
		end;
	end;

procedure agregaradelante(var sp:lista; p:producto);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=p;
		nue^.sig:=sp;
		sp:=nue;
	end;

procedure carga(var sp:lista);
	var
		p:producto;
	begin
		leer_producto(p);
		while (p.codigo <> -1) do begin
			agregaradelante(sp, p);
			leer_producto(p);
		end;
	end;

	procedure porcentaje_producto(stock_actual, stock_minimo:integer; var cant_minimo, cantidad_producto:integer);
		begin
			cantidad_producto:=cantidad_producto+1;
			if (stock_actual < stock_minimo) then
				cant_minimo:=cant_minimo+1;			
		end;

	procedure descripcion_par(cod:integer; descripcion:string; var descripcion_resultado:string);
		var 
			cant_par, digito:integer;
		begin
			cant_par:=0;
			while (cod<> 0) and (cant_par < 3) do begin
				digito:=cod mod 10;
				if (digito mod 2 = 0) then
					cant_par:=cant_par+1;
				cod:=cod div 10;
			end;
			if (cant_par <= 3) then
				descripcion_resultado:=descripcion;
			end;

	procedure produc_economico(p:producto; var cod1, cod2:integer; var minimo1, minimo2:real);	
		begin
			if (p.precio < minimo1) then begin
				minimo2:=minimo1;
				cod2:=cod1;
				minimo1:=p.precio;
				cod1:=p.codigo;
			end
			else
				if (p.precio < minimo2) then begin
					minimo2:=p.precio;
					cod2:=p.codigo;	
			end;			
		end;
procedure recorrer_lista(sp:lista);
	var
		cant_minimo, cantidad_producto, cant_par, digito, aux, cod1, cod2:integer;
		porcentaje_p, minimo1, minimo2:real;
		p:producto;
		descripcion_resultado:string;
	begin
		porcentaje_p:=0;
		cantidad_producto:=0;
		cant_minimo:=0;
		minimo1:=9999;
		minimo2:=9999;
		cod2:=0;
		cod1:=0;
		while (sp <> nil) do begin
			porcentaje_producto(sp^.dato.stock_actual, sp^.dato.stock_minimo, cant_minimo, cantidad_producto);
			writeln('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares ', descripcion_resultado);
			produc_economico(sp^.dato, cod1, cod2, minimo1, minimo2);
			descripcion_par(sp^.dato.codigo, sp^.dato.descripcion, descripcion_resultado);
			sp:=sp^.sig;
		end;
		porcentaje_p:=cant_minimo*100/cantidad_producto;
		writeln('El Porcentaje de productos con stock actual por debajo de su stock minimo es ',porcentaje_p:4:2);
		writeln('El Codigo de los dos productos mas economicos es ',cod1,' y ', cod2);
	end;
procedure imprimir(sp:lista);
	begin
		while (sp <> nil) do begin
			writeln(sp^.dato.codigo);
			sp:=sp^.sig;
		end;
	end;

	var
		super_produc:lista;
	begin
	super_produc:=nil;
	carga(super_produc);
	//imprimir(super_produc); LO HICE PORQUE ALGO ANDA MAL... PERO YA ANDA :)
	recorrer_lista(super_produc);
	readln();
	end.